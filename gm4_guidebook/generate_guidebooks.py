import colorsys
import json
import logging
import os
import sys
from typing import Any, ClassVar, Literal, Optional, cast
from pathlib import Path

import nbtlib  # type: ignore ; missing stub file
from beet import (
    Advancement,
    Context,
    DataPack,
    FileDeserialize,
    Function,
    JsonFile,
    JsonFileBase,
    LootTable,
    Model,
    NamespaceContainer,
    NamespaceFileScope,
    PngFile,
    Texture,
)
from beet.contrib.vanilla import Vanilla
from beet.core.utils import TextComponent
from PIL import Image, ImageDraw
from pydantic.v1 import BaseModel

from gm4.plugins.player_heads import Skin

logger = logging.getLogger(__name__)

# TODO:
# merge some functions to reduce fuction call overhead


class Section(BaseModel):
  name: str
  pages: list[TextComponent]
  enable: list[dict[str, int|str]]
  requirements: list[list[str]]
  prerequisites: list[str] = []
  grants: list[str] = []


class Icon(BaseModel):
  id: str
  components: Optional[dict[str, Any]]


class Book(BaseModel):
  id: str
  name: str
  module_type: Literal["expansion", "base", "module"]
  load_check: Optional[str]
  base_module: Optional[str]
  icon: Icon
  criteria: dict[str, dict[Any, Any]]
  sections: list[Section]
  trigger_id: int = -1 # value set by triggers.json
  description: Optional[str]
  wiki_link: Optional[str]

class GuidebookPages(JsonFileBase[Book]):
  """defines a custom beet filetype for guidebook pages"""
  scope: ClassVar[NamespaceFileScope] = ("guidebook",)
  extension: ClassVar[str] = ".json"
  data: ClassVar[FileDeserialize[Book]] = FileDeserialize()
  model = Book # tell beet to parse this file using the Book data model

class CustomCrafterRecipe(JsonFile):
  """defines a custom beet filetype for CC recipes"""
  scope: ClassVar[NamespaceFileScope] = ("gm4_recipes",)
  extension: ClassVar[str] = ".json"

  # NOTE in the future, this can be moved to wherever we auto-generate CC recipes from


def load_page_data(ctx: Context):
  """registers guidebook files with the beet file loader"""
  ctx.data.extend_namespace.append(GuidebookPages)
  yield
  ctx.data[GuidebookPages].clear()

def load_custom_recipes(ctx: Context):
  ctx.data.extend_namespace.append(CustomCrafterRecipe)
  yield
  ctx.data[CustomCrafterRecipe].clear()


def beet_default(ctx: Context):
  if not ctx.data[GuidebookPages]:
    return # there are no pages configured

  generate_files(ctx, ctx.data)

  if ctx.data.overlays:
    for d in ctx.data.overlays.values():
      if not d[GuidebookPages]:
        continue
      generate_files(ctx, d, True)


"""
parse guidebook file and generate all files
"""
def generate_files(ctx:Context, d: DataPack, overlay: bool = False):
  for book in [b.data for b in d[GuidebookPages].values()]:
  
    # get trigger id, generate one if not already existing
    triggers_file = JsonFile(source_path="gm4_guidebook/triggers.json")
    triggers = triggers_file.data

    if book.id not in triggers:
        if os.getenv("GITHUB_ACTIONS"):
          logger.error("Github Actions cannot add guidebook triggers. Run the build locally and commit changes to gm4_guidebook/triggers.json")
          sys.exit(1) # quit the build and mark the github action as failed

        triggers[book.id] = triggers['__next__']
        triggers['__next__'] += 1
        triggers_file.data = dict(sorted(triggers.items()))
        triggers_file.dump(origin="", path="gm4_guidebook/triggers.json")
    book.trigger_id = triggers[book.id]

    # get description
    if not book.description:
      book.description = ctx.meta["gm4"]["website"]["description"] if "website" in ctx.meta["gm4"] else ""

    # get load check
    if not book.load_check:
      book.load_check = book.id
    if "gm4_" not in book.load_check:
      book.load_check = f"gm4_{book.load_check}"

    # get wiki link
    if not book.wiki_link:
      book.wiki_link = ctx.meta['gm4']['wiki'] if "wiki" in ctx.meta["gm4"] else ""

    # read the dict and get the page storages
    loottable, lectern_loot, pages, lectern_pages = generate_loottable(book)

    # add loot tables to datapack
    d[f"gm4_guidebook:{book.id}"] = loottable
    d[f"gm4_guidebook:lectern/{book.id}"] = lectern_loot

    # add functions to datapack
    d[f"gm4_guidebook:{book.id}/add_toc_line"] = generate_add_toc_line_function(book, overlay)
    d[f"gm4_guidebook:{book.id}/setup_storage"] = generate_setup_storage_function(
      pages, lectern_pages, book, ctx, overlay)
    d[f"gm4_guidebook:{book.id}/summon_marker"] = generate_summon_marker_function(book, overlay)
    d[f"gm4_guidebook:{book.id}/update_hand"] = generate_update_hand_function(book, overlay)
    d[f"gm4_guidebook:{book.id}/update_lectern"] = generate_update_lectern_function(book, overlay)

    # add advancements to datapack
    d["gm4_guidebook:root"] = root_advancement()
    for index, section in enumerate(book.sections):
      if (advancement := generate_advancement(book, index)) is not None:
        d[f"gm4_guidebook:{book.id}/unlock/{section.name}"] = advancement
        d[f"gm4_guidebook:{book.id}/display/{section.name}"] = generate_display_advancement(book, ctx.project_id)
        d[f"gm4_guidebook:{book.id}/rewards/{section.name}"] = generate_reward_function(
          section, book.id, book.name, book.description)
        
    # register and create advancement icons to resource pack
    if d is ctx.data: # don't run for overlays - its not needed
      ctx.meta['gm4'].setdefault('model_data',[]).append({
        "template": "custom",
        "reference": f"{ctx.project_id}:guidebook_icon/{book.id}",
        "item": book.icon.id.removeprefix("minecraft:"),
      })
      ctx.assets[f"{ctx.project_id}:guidebook_icon/{book.id}"] = generate_toast_model(book, ctx)

  d[GuidebookPages].clear()


"""
Alphabetical hash to convert the name of the module into a float
"""
def get_pos_hash(module_id: str):
  # ignore the underscores
  id = module_id.replace("_", "")
  n:list[int] = []
  # get number for each character (ascii -> int)
  for l in id:
    n.append(ord(l) - 96) # ascii A = 96, int A = 0
  while len(n) < 11:
    n.append(0)
  # alphabetical hash
  id = sum(n[i] * (27 ** (10 - i)) for i in range(11)) / 1000000000000
  return id



"""
Generates the book's header for the player's hand
"""
def generate_book_header(book: Book) -> list[dict[Any, Any]|str]:
  # header JSON
  header: list[dict[Any, Any]|str] = [
    "",
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "↖⌂ ",
          "color": "#3D83A3"
        },
        {
          "translate": "gui.gm4.guidebook.header.toc",
          "fallback": "↖⌂ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "run_command",
        "value": "/trigger gm4_guide set 1"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.return_to_toc",
          "fallback": "Return to the table of contents"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " Ⓦ ",
          "color": "#864bc7"
        },
        {
          "translate": "gui.gm4.guidebook.header.wiki",
          "fallback": " Ⓦ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "open_url",
        "value": book.wiki_link
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.open_wiki",
          "fallback": "Open the wiki page for this module"
        }
      }
    },
    " " * 8,
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " ⟳ ",
          "bold": True,
          "color": "dark_green"
        },
        {
          "translate": "gui.gm4.guidebook.header.refresh",
          "fallback": " Ⓦ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide set {book.trigger_id}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.refresh",
          "fallback": "Refresh section"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text":  " ◀ "
        },
        {
          "translate": "gui.gm4.guidebook.header.prev",
          "fallback": " ◀ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide_prev set {book.trigger_id}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.prev",
          "fallback": "Go to the previous module"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " ▶ "
        },
        {
          "translate": "gui.gm4.guidebook.header.next",
          "fallback": " ▶ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide_next set {book.trigger_id}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.next",
          "fallback": "Go to the next module"
        }
      }
    },
    "\n",
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " ↖⌂",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.toc.under",
          "fallback": " ↖⌂",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "run_command",
        "value": "/trigger gm4_guide set 1"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.return_to_toc",
          "fallback": "Return to the table of contents"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  Ⓦ",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.wiki.under",
          "fallback": "  Ⓦ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "open_url",
        "value": book.wiki_link
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.open_wiki",
          "fallback": "Open the wiki page for this module"
        }
      }
    },
    " " * 8,
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  ⟳",
          "bold": True,
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.refresh.under",
          "fallback": "  ⟳",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide set {book.trigger_id}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.refresh",
          "fallback": "Refresh section"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  ◀",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.prev.under",
          "fallback": "  ◀",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide_prev set {book.trigger_id}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.prev",
          "fallback": "Go to the previous module"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  ▶",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.next.under",
          "fallback": "  ▶",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide_next set {book.trigger_id}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.next",
          "fallback": "Go to the next module"
        }
      }
    },
    "\n",
    {
      "translate": "gui.gm4.guidebook.page",
      "fallback": "",
      "color": "white",
      "font": "gm4:guidebook"
    }
  ]
  return header



"""
Generates the book's header for the lectern 
difference is change_page vs run_command click events
"""
def generate_lectern_header(book: Book) -> list[dict[Any, Any]|str]:
  # header JSON
  header: list[dict[Any, Any]|str] = [
    "",
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "↖⌂ ",
          "color": "#3D83A3"
        },
        {
          "translate": "gui.gm4.guidebook.header.toc",
          "fallback": "↖⌂ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "change_page",
        "value": "2"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.return_to_toc",
          "fallback": "Return to the table of contents"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " Ⓦ ",
          "color": "#864bc7"
        },
        {
          "translate": "gui.gm4.guidebook.header.wiki",
          "fallback": " Ⓦ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "open_url",
        "value": book.wiki_link
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.open_wiki",
          "fallback": "Open the wiki page for this module"
        }
      }
    },
    " " * 8,
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " ⟳ ",
          "bold": True,
          "color": "dark_green"
        },
        {
          "translate": "gui.gm4.guidebook.header.refresh",
          "fallback": " ⟳ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "change_page",
        "value": "3"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.refresh",
          "fallback": "Refresh section"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " ◀ "
        },
        {
          "translate": "gui.gm4.guidebook.header.prev",
          "fallback": " ◀ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "change_page",
        "value": "4"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.prev",
          "fallback": "Go to the previous module"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " ▶ "
        },
        {
          "translate": "gui.gm4.guidebook.header.next",
          "fallback": " ▶ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "change_page",
        "value": "1"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.next",
          "fallback": "Go to the next module"
        }
      }
    },
    "\n",
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " ↖⌂",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.toc.under",
          "fallback": " ↖⌂",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "change_page",
        "value": "2"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.return_to_toc",
          "fallback": "Return to the table of contents"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  Ⓦ",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.wiki.under",
          "fallback": "  Ⓦ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "open_url",
        "value": book.wiki_link
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.open_wiki",
          "fallback": "Open the wiki page for this module"
        }
      }
    },
    " " * 8,
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  ⟳",
          "bold": True,
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.refresh.under",
          "fallback": "  ⟳",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "change_page",
        "value": "3"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.refresh",
          "fallback": "Refresh section"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  ◀",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.prev.under",
          "fallback": "  ◀",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "change_page",
        "value": "4"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.prev",
          "fallback": "Go to the previous module"
        }
      }
    },
    {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  ▶",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.header.next.under",
          "fallback": "  ▶",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "clickEvent": {
        "action": "change_page",
        "value": "1"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.next",
          "fallback": "Go to the next module"
        }
      }
    },
    "\n",
    {
      "translate": "gui.gm4.guidebook.page",
      "fallback": "",
      "color": "white",
      "font": "gm4:guidebook"
    }
  ]
  return header



"""
Reads a loot table (custom item) and creates a JSON text component to display the item in the guidebook
"""
def loottable_to_display(loottable: str, ctx: Context) -> tuple[TextComponent, TextComponent]:
  item = loottable.split(":")[1].split("/")[-1]
  if "gm4" in loottable:	
    item = f"gm4.{item}"
  else:
    item = f"minecraft.{item}"

  loot = ctx.data.loot_tables[loottable].data

  if len(loot["pools"]) > 1:
    raise ValueError("Loot table has multiple pools")
  if len(loot["pools"][0]["entries"]) > 1:
    raise ValueError("Loot table has multiple entries")
  if "item" not in loot["pools"][0]["entries"][0]["type"]:
    raise ValueError("Loot table does not return an item")
  
  # get item id, name, lore, and color
  entry: dict[Any, Any] = loot["pools"][0]["entries"][0]
  item_id: str = entry["name"]
  profile_name: str = ""
  name: TextComponent = ""
  lore: list[str] = []
  if "functions" in entry:
    for function in entry["functions"]:
      if "set_name" in function["function"]:
        name = f'{json.dumps(function["name"])}'
      elif "set_lore" in function["function"]:
        for line in function["lore"]:
          lore.append(f'{json.dumps(line)}')
      elif "set_components" in function["function"]:
        for key, value in function["components"].items():
          if "profile" in key:
            profile_name = value if isinstance(value, str) else value.get("name", "")

  # color
  # if "player_head" in item_id and "$" in profile_name:
  #   skull_owner = profile_name.replace("$","")
  #   if ":" not in skull_owner:
  #     skull_owner = f"{ctx.project_id}:{skull_owner}" # NOTE gm4.utils will have an add_namespace helper function after the RP PR
  #   skin = ctx.data[Skin][skull_owner]

  #   color = get_texture_color(skin)

  # else:
  color = get_texture_color(intuit_item_texture(item_id, ctx.inject(Vanilla)))

  # create slot
  slot: dict[Any, Any] = {
    "translate": "gm4.second",
    "fallback": "%1$s",
    "with": [
      {
        "text": " ☒ ",
        "color": color
      },
      {
        "translate": f"gui.gm4.guidebook.crafting.display.{item}",
        "fallback": " ☒ ",
        "color": "white",
        "font": "gm4:guidebook"
      }
    ],
    "hoverEvent": {
      "action": "show_item",
      "contents": {
        "id": item_id
      }
    }
  }
  slot_under: dict[Any, Any] = {
    "translate": "gm4.second",
    "fallback": "%1$s",
    "with": [
      {
        "text": "  ☒",
        "color": "#fcfcf0"
      },
      {
        "translate": "gui.gm4.guidebook.crafting.display.filled_slot.under",
        "fallback": "  ☒",
        "color": "white",
        "font": "gm4:guidebook"
      }
    ],
    "hoverEvent": {
      "action": "show_item",
      "contents": {
        "id": item_id
      }
    }
  }

  # custom display name and lore
  display_name = ""
  display_lore = ""
  if name != "":
    display_name = f"Name:'{name}'"
  if len(lore) > 0:
    display_lore = f"Lore:{lore}"
  if display_name != "" or display_lore != "":
    display_tag = "{display:{" + display_name + "," + display_lore + "}}"
    slot["hoverEvent"]["contents"]["tag"] = f"{display_tag}"
    slot_under["hoverEvent"]["contents"]["tag"] = f"{display_tag}"
  return slot, slot_under



"""
Reads a vanilla item and creates a JSON text component to display the item in the guidebook
"""
def item_to_display(ingredient: dict[Any, Any], ctx: Context) -> tuple[TextComponent, TextComponent]:
  vanilla = ctx.inject(Vanilla)
  if ingredient.get("id") == "empty":
    # show empty slot ()
    slot = {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " ☐ "
        },
        {
          "translate": "gui.gm4.guidebook.crafting.display.empty_slot",
          "fallback": " ☐ ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ]
    }
    slot_under = {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": "  ☐",
          "color": "#fcfcf0"
        },
        {
          "translate": "gui.gm4.guidebook.crafting.display.empty_slot.under",
          "fallback": "  ☐",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ]
    }
  else:
    # show filled slot (colored with a hover event)
    if "display" in ingredient and "loot_table" in ingredient["display"]["type"]:
      return loottable_to_display(ingredient["display"]["name"], ctx)
    else:
      if "display" in ingredient and "item" in ingredient["display"]["type"]:
        item = ingredient["display"]["name"]
      else:
        item = ingredient["id"]
      color = get_texture_color(intuit_item_texture(item, vanilla))
      slot: dict[Any, Any] = {
        "translate": "gm4.second",
        "fallback": "%1$s",
        "with": [
          {
            "text": " ☒ ",
            "color": color
          },
          {
            "translate": f"gui.gm4.guidebook.crafting.display.{item.replace(':','.')}",
            "fallback": " ☒ ",
            "color": "white",
            "font": "gm4:guidebook"
          }
        ],
        "hoverEvent": {
          "action": "show_item",
          "contents": {
            "id": item
          }
        }
      }
      slot_under: dict[Any, Any] = {
        "translate": "gm4.second",
        "fallback": "%1$s",
        "with": [
          {
            "text": "  ☒",
            "color": "#fcfcf0"
          },
          {
            "translate": "gui.gm4.guidebook.crafting.display.filled_slot.under",
            "fallback": "  ☒",
            "color": "white",
            "font": "gm4:guidebook"
          }
        ],
        "hoverEvent": {
          "action": "show_item",
          "contents": {
            "id": item
          }
        }
      }
      if "tag" in ingredient:
        slot["hoverEvent"]["contents"]["tag"] = ingredient['tag']
        slot_under["hoverEvent"]["contents"]["tag"] = ingredient['tag']
  return slot, slot_under



"""
Recursively reads vanilla item tags to find a single item to use
"""
def get_item_from_tag(item_tag: str, vanilla: Vanilla) -> str:
  # prepare item tag for searching
  if "minecraft" in item_tag:
    if "#" in item_tag:
      item_tag = item_tag[11:]
    else:
      item_tag = item_tag[10:]
  elif item_tag.split(":")[0] != "minecraft":
    raise ValueError("Only vanilla item tags are supported")

  # open item tag
  item_tags = vanilla.mount("data/minecraft/tags").data["minecraft"].item_tags
  items = item_tags[item_tag].data["values"]

  # if first value is another tag, recursively search until an item is found
  if "#" not in items[0]:
    return items[0]
  return get_item_from_tag(items[0], vanilla)



"""
Generates a crafting grid to be displayed in the guidebook
"""
def generate_recipe_display(recipe: str, ctx: Context) -> list[TextComponent]:
  r = ctx.data[CustomCrafterRecipe][recipe].data

  # get recipe ingredients
  ingredients:list[dict[str, str]] = []
  shapeless = "  "

  # shaped
  if r["input"]["type"] == "shaped":
    input: list[str] = r["input"]["recipe"]

    # fix configured shape to be a full 3x3 grid
    while len(input) < 3:
      input.append("   ")
    for i in range(3):
      while len(input[i]) < 3:
        input[i] += " "

    # convert input into list of ingredients
    for i in range(3):
      for j in range(3):
        ingredient = input[i][j]
        item: dict[str,str] = {}
        if ingredient == " ":
          item["id"] = "empty"
        else:
          if isinstance(r["input"]["key"][ingredient], list):
            ingr = r["input"]["key"][ingredient][0]
          else:
            ingr = r["input"]["key"][ingredient]
          
          if "guidebook" in ingr:
            item["display"] = ingr["guidebook"]
          else:
            if "tag" in ingr:
              item["id"] = get_item_from_tag(ingr["tag"], ctx.inject(Vanilla))
            else:
              item["id"] = ingr["item"]
            if "nbt" in ingr:
              item["tag"] = ingr["nbt"].replace("'",'\"')
        ingredients.append(item)

  # shapeless
  elif r["input"]["type"] == "shapeless":
    shapeless = {
      "translate": "gm4.second",
      "fallback": "%1$s",
      "with": [
        {
          "text": " 🔀 ",
          "color": "dark_gray"
        },
        {
          "translate": "gui.gm4.guidebook.crafting.display.shapeless",
          "fallback": " 🔀 ",
          "color": "white",
          "font": "gm4:guidebook"
        }
      ],
      "hoverEvent": {
        "action": "show_text",
        "contents": {
          "translate": "text.gm4.guidebook.shapeless",
          "fallback": "Recipe is shapeless"
        }
      }
    }
    for ingredient in r["input"]["ingredients"]:
      item = {}
      if ingredient == " ":
        item["id"] = "empty"
      else:
        if isinstance(ingredient, list):
          item["id"] = ingredient[0]["item"] # type: ignore
          if "guidebook" in ingredient[0]:
            item["display"] = ingredient[0]["guidebook"] # type: ignore
        else:
          if "guidebook" in ingredient:
            item["display"] = ingredient["guidebook"]
          else:
            item["id"] = ingredient["item"]
            if "nbt" in ingredient:
              item["tag"] = ingredient["nbt"].replace("'",'\"')
      ingredients.append(item)
    while len(ingredients) < 9:
      ingredients.append({"id": "empty"})

  # unknown
  else:
    raise ValueError(f'Unknown recipe type: {r["input"]["type"]}')
  
  # get JSON for each ingredient
  d_ingredients: list[TextComponent] = []
  d_under: list[TextComponent] = []
  for ingredient in ingredients:
    slot, slot_under = item_to_display(ingredient, ctx)
    d_ingredients.append(slot)
    d_under.append(slot_under)

  # get recipe results
  if "type" in r["output"]:
    output_type = r["output"]["type"]
  else:
    output_type = "normal"
  
  res: dict[str, Any] = {}
  if output_type == "normal":
    res = r["output"]["result"]
  elif output_type == "special":
    res = r["output"]["guidebook"]
  elif output_type == "replace":
    raise NotImplementedError('output type "replace" is not yet implemented')  # TODO: support replace output type
  else:
    raise ValueError(f"Unknown output type: '{output_type}'")
  
  # get display
  if "item" in res["type"]:
    res["id"] = res["name"]
    result, result_under = item_to_display(res, ctx)
  else:
    result, result_under = loottable_to_display(res["name"], ctx)
  
  # show count
  res_count = ""
  if "count" in res and res["count"] > 1:
    res_count = {
      "translate": f"gui.gm4.guidebook.crafting.display.count.{res['count']}",
      "fallback": "",
      "color": "white",
      "font": "gm4:guidebook"
    }
    NUMBERS = ["☐","☒","②","③","④","⑤","⑥","⑦","⑧","⑨","⑩","⑪","⑫","⑬","⑭","⑮","⑯","⑰","⑱","⑲","⑳"]
    result["with"][0]["text"] = NUMBERS[res["count"]] # type: ignore

  ARROW = {
    "translate": "gm4.second",
    "fallback": "%1$s",
    "with": [
      {
        "text": " → "
      },
      {
        "translate": "gui.gm4.guidebook.crafting.display.arrow",
        "fallback": " → ",
        "color": "white",
        "font": "gm4:guidebook"
      }
    ]
  }
  ARROW_UNDER = {
    "translate": "gm4.second",
    "fallback": "%1$s",
    "with": [
      {
        "text": "  →",
        "color": "#fcfcf0"
      },
      {
        "translate": "gui.gm4.guidebook.crafting.display.arrow.under",
        "fallback": "  →",
        "color": "white",
        "font": "gm4:guidebook"
      }
    ]
  }

  CRAFTING = {
    "translate": "gui.gm4.guidebook.crafting.display.grid",
    "fallback": "",
    "color": "white",
    "font": "gm4:guidebook"
  }

  margin = " " * 3
  display: list[TextComponent] = [
    "",
    CRAFTING,
    "\n",
    margin,
    d_ingredients[0],
    d_ingredients[1],
    d_ingredients[2],
    shapeless,
    "\n",
    margin,
    d_under[0],
    d_under[1],
    d_under[2],
    "\n",
    margin,
    d_ingredients[3],
    d_ingredients[4],
    d_ingredients[5],
    ARROW,
    result,
    res_count,
    "\n",
    margin,
    d_under[3],
    d_under[4],
    d_under[5],
    ARROW_UNDER,
    result_under,
    "\n",
    margin,
    d_ingredients[6],
    d_ingredients[7],
    d_ingredients[8],
    "\n",
    margin,
    d_under[6],
    d_under[7],
    d_under[8]
  ]
  return display




"""
Calculate how many advances each character takes up when written in the default minecraft font
"""
def char_advance(char: str) -> int:
  advances = JsonFile(source_path="gm4_guidebook/advances.json").data
  # find char in database
  if char in advances:
    if type(advances[char]) == dict:
      return advances[char]["unicode"]
    return advances[char]
  return 6



"""
Splits a string into how a minecraft book would display it in multiple lines
"""
def split_into_lines(str: str) -> list[int]:
  lines:list[Any] = []
  words:list[Any] = []
  # split string into words
  for word in str.split(" "):
    # count how many advances are in each word
    wlen = 0
    for char in word:
      wlen += char_advance(char)
    words.append((word, wlen))

  current_line = ""
  current_len = 0
  # generate each line based on advances of each word
  for word, wlen in words:
    if current_len + wlen > 114: # 114 is max number of advances in each line
      if not current_line == "":
        lines.append(current_line)
      current_line = ""
      current_len = 0
      # if a single word is greater than the max, it gets split every 114 advances
      if wlen > 114:
        for char in word:
          if current_len + char_advance(char) > 114:
            lines.append(current_line)
            current_line = ""
            current_len = 0
          current_line += char
          current_len += char_advance(char)
        continue
    current_line += word + " "
    current_len += wlen + 4

  # add each line to a list, without trailing spaces
  lines.append(current_line)
  for i in range(len(lines)):
    lines[i] = lines[i].removesuffix(" ")

  return lines



"""
Return a bulletted string of the module name, indented if it's an expansion
"""
def get_toc_line(book_dict: Book) -> str:
  indent = "  ● " if book_dict.module_type == "expansion" else "● "
  return f"{indent}{book_dict.name}"



"""
Reads the book object to generate the loot tables (one for hand, one for lectern)
and the page contents that need to be stored
"""
def generate_loottable(book: Book) -> tuple[LootTable, LootTable, list[Any], list[Any]]:
  page_storage:list[Any] = []
  lectern_storage:list[Any] = []

  # standard functions for every hand loot table
  functions:list[dict[Any, Any]] = [
    {
      "function": "minecraft:set_components",
      "components": {
        "minecraft:custom_model_data": "gm4_guidebook:item/guidebook",
        "minecraft:written_book_content": {
          "pages": [],
          "title": "Gamemode 4 Guidebook",
          "author": "Unknown",
          "generation": 3
        }
      }
    },
    {
      "function": "minecraft:set_custom_data",
      "tag": f"{'{'}gm4_guidebook:{'{'}lectern:0b, trigger:{str(book.trigger_id)}{'}'}{'}'}"
    },
    {
      "function": "minecraft:set_name",
      "name": {
        "translate": "text.gm4.guidebook.title",
        "fallback": "Gamemode 4 Guidebook",
        "italic": False
      }
    },
    {
      "function": "minecraft:set_count",
      "count": {
        "type": "minecraft:score",
        "target": {
          "type": "minecraft:fixed",
          "name": "$count"
        },
        "score": "gm4_guide"
      }
    }
  ]

  # standard functions for every lectern loot table
  functions_lectern:list[dict[Any, Any]] = [
    {
      "function": "minecraft:set_components",
      "components": {
        "minecraft:custom_model_data": "gm4_guidebook:item/guidebook",
        "minecraft:written_book_content": {
          "pages": [],
          "title": "Gamemode 4 Guidebook",
          "author": "Unknown",
          "generation": 3
        }
      }
    },
    {
      "function": "minecraft:set_custom_data",
      "tag": f"{'{'}gm4_guidebook:{'{'}lectern:1b, trigger:{str(book.trigger_id)}{'}'}{'}'}"
    },
    {
      "function": "minecraft:set_name",
      "name": {
        "translate": "text.gm4.guidebook.title",
        "fallback": "Gamemode 4 Guidebook",
        "italic": False
      }
    },
    # {
    #   "function": "minecraft:copy_nbt",
    #   "source": {
    #     "type": "minecraft:storage",
    #     "source": "gm4_guidebook:pages"
    #   },
    #   "ops": [
    #     {
    #       "source": "lectern_front_matter[]",
    #       "target": "pages",
    #       "op": "append"
    #     }
    #   ]
    # }
  ]

  # create conditions list for each section
  for i, section in enumerate(book.sections):
    enable_conditions:list[dict[Any, Any]] = []

    # condition to check load status of other modules
    for module_check in section.enable:
      condition = {
        "condition": "minecraft:value_check",
        "value": {
           "type": "minecraft:score",
           "target": {
               "type": "minecraft:fixed",
               "name": module_check['id']
           },
           "score": "load.status"
            },
        "range": {"min": 1}
      }
      if module_check["load"] <= 0: # type: ignore
        condition = {"condition": "minecraft:inverted", "term": condition}
      enable_conditions.append(condition)

    # condition to check if another page is unlocked
    unlock_condition = {
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": {
        "type_specific": {
          "type": "player",
          "advancements": {
            f"gm4_guidebook:{book.id}/unlock/{section.name}": True
          }
        }
      }
    }

    # condition to check if another page is locked
    lock_condition = {
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": {
        "type_specific": {
          "type": "player",
          "advancements": {
            f"gm4_guidebook:{book.id}/unlock/{section.name}": False
          }
        }
      }
    }

    # create operations for page appending
    enabled_ops:list[dict[Any, Any]] = []
    fallback_ops:list[dict[Any, Any]] = []
    enabled_ops_lectern:list[dict[Any, Any]] = []
    fallback_ops_lectern:list[dict[Any, Any]] = []
    for page in section.pages:
      # append from the indexed storage
      enabled_ops.append({
        "op": "append",
        "source": f"{book.id}.pages[{len(page_storage)}]",
        "target": "pages"
      })
      # generate the page storage
      page_storage.append(page)

      enabled_ops_lectern.append({
        "op": "append",
        "source": f"{book.id}.lectern[{len(lectern_storage)}]",
        "target": "pages"
      })
      lectern_storage.append(page)

    # locked pages to be appended
    fallback_default = {
      "op": "append",
      "source": f"{book.id}.locked[0]",
      "target": "pages"
    }
    fallback_default_lectern = {
      "op": "append",
      "source": f"{book.id}.locked[1]",
      "target": "pages"
    }
    fallback_ops = [fallback_default] * len(enabled_ops)
    fallback_ops_lectern = [fallback_default_lectern] * len(enabled_ops)
    if (i == 0):
      fallback_ops[0] = {
        "op": "append",
        "source": f"{book.id}.locked[2]",
        "target": "pages"
      }
      fallback_ops_lectern[0] = {
        "op": "append",
        "source": f"{book.id}.locked[3]",
        "target": "pages"
      }

    # functions for each section
    function: dict[Any, Any] = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": "gm4_guidebook:pages"
      },
      "ops": enabled_ops,
      "conditions": [*enable_conditions]
    }
    fallback_function: dict[Any, Any] = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": "gm4_guidebook:pages"
      },
      "ops": fallback_ops,
      "conditions": [*enable_conditions]
    }

    # lectern functions for each section
    function_lectern: dict[Any, Any] = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": "gm4_guidebook:pages"
      },
      "ops": enabled_ops_lectern,
      "conditions": [*enable_conditions]
    }
    fallback_function_lectern: dict[Any, Any] = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": "gm4_guidebook:pages"
      },
      "ops": fallback_ops_lectern,
      "conditions": [*enable_conditions]
    }
    
    # add functions to the section
    if section.requirements and len(section.requirements) > 0:
      function["conditions"].append(unlock_condition)
      fallback_function["conditions"].append(lock_condition)
      # functions.append(function)
      # functions.append(fallback_function)

      function_lectern["conditions"].append(unlock_condition)
      fallback_function_lectern["conditions"].append(lock_condition)
      # functions_lectern.append(function_lectern)
      # functions_lectern.append(fallback_function_lectern)
    else:
      pass
      # functions.append(function)
      # functions_lectern.append(function_lectern)

  # extra blank page for lecterns
  # functions_lectern.append({
  #   "function": "minecraft:copy_nbt",
  #   "source": {
  #     "type": "minecraft:storage",
  #     "source": "gm4_guidebook:pages"
  #   },
  #   "ops": [
  #     {
  #       "source": "blank",
  #       "target": "pages",
  #       "op": "append"
  #     }
  #   ]
  # })

  hand_loot = LootTable({
    "pools": [
      {
        "rolls": 1,
        "entries": [
          {
            "type": "minecraft:item",
            "name": "minecraft:written_book",
            "functions": functions
          }
        ]
      }
    ]
  })

  lectern_loot = LootTable({
    "pools": [
      {
        "rolls": 1,
        "entries": [
          {
            "type": "minecraft:item",
            "name": "minecraft:written_book",
            "functions": functions_lectern
          }
        ]
      }
    ]
  })

  return hand_loot, lectern_loot, page_storage, lectern_storage



"""
Replaces {"insert": "X"} with custom data (header, locked text, or recipe)
"""
def populate_insert(element: dict[Any, Any], book: Book, ctx: Context, lectern: bool = False) -> TextComponent:
  if "insert" in element.keys():
    # header
    if element["insert"] == "title":
      return {
          "text": f"{book.name}\n",
          "underlined": True,
          "color": "#4AA0C7"
        }
    # (default) locked text
    elif element["insert"] == "locked_text":
      locked_text = ["\n",{'translate':'gm4.second','fallback':'%1$s',"with":[{'text':'\n\n\n\n           ???           '},{'translate': 'gui.gm4.guidebook.locked_page', 'fallback': '\n\n\n\n           ???           ','color': 'white','font':'gm4:guidebook'}],'hoverEvent':{'action':'show_text','contents':[{'translate':'text.gm4.guidebook.undiscovered','fallback':'Undiscovered','italic':True,'color':'red'}]}}]
      return locked_text
    # title page locked text
    elif element["insert"] == "locked_text_title":
      locked_text = ["",{'translate':'gm4.second','fallback':'%1$s',"with":[{'text':'\n\n\n\n           ???           '},{'translate': 'gui.gm4.guidebook.locked_page', 'fallback': '\n\n\n\n           ???           ','color': 'white','font':'gm4:guidebook'}],'hoverEvent':{'action':'show_text','contents':[{'translate':'text.gm4.guidebook.undiscovered','fallback':'Undiscovered','italic':True,'color':'red'}]}}]
      return locked_text
    # recipes
    elif element["insert"] == "recipe":
      return generate_recipe_display(element["recipe"], ctx)
    else:
      raise ValueError(f'Unknown insert type: {element["insert"]}')
  return element



"""
Converts the JSON text component into a string to be placed inside the page NBT
"""
def stringify_page(page: TextComponent, book: Book, ctx: Context, lectern: bool = False) -> str:
  page_with_header: list[dict[Any,Any]|str] = generate_lectern_header(book) if lectern else generate_book_header(book)
  # populate insertions for a single value
  if isinstance(page, dict):
    if "insert" in page.keys():
      page = populate_insert(page, book, ctx, lectern)
  # populate insertions for a list
  elif isinstance(page, list):
    for i, element in enumerate(page):
      if isinstance(element, dict) and "insert" in element.keys():
        page[i] = populate_insert(element, book, ctx, lectern) #type: ignore
  # stringify the page
  if isinstance(page, list):
    page_with_header.extend(page)
  else:
    page_with_header.append(page)
  return f'{json.dumps(page_with_header)}'



"""
Creates a criterion for a prerequisite
"""
def generate_prereq(prereq: str, module: str):
  if ":" in prereq:
    module = prereq.split(":")[0]
    prereq = prereq.split(":")[1]
  criterion = {
    "trigger": "minecraft:tick",
    "conditions": {
      "player": [
        {
          "condition": "minecraft:entity_properties",
          "entity": "this",
          "predicate": {
            "type_specific": {
              "type": "player",
              "advancements": {
                f"gm4_guidebook:{module}/unlock/{prereq}": True
              }
            }
          }
        }
      ]
    }
  }
  return criterion



"""
Create the advancement to unlock a section
"""
def generate_advancement(book: Book, section_index: int) -> Advancement | None:
  # get the target section (based on index)
  section: Section = book.sections[section_index]
  module_id = book.id
  all_criteria = book.criteria
  criteria_keys: set[str] = set()
  reqs = section.requirements

  # add requirements to advancement
  for requirement in section.requirements:
    for criterion in requirement:
      criteria_keys.add(criterion)
  if section.prerequisites:
    for prereq in section.prerequisites:
      all_criteria[f"prereq/{prereq}"] = generate_prereq(prereq, module_id)
      criteria_keys.add(f"prereq/{prereq}")
      reqs.append([f"prereq/{prereq}"])
  if len(criteria_keys) == 0:
    return None

  # standard checks for load checking and spectator prevention
  extra_player_checks = [
    {
      "condition": "minecraft:inverted",
      "term": {
        "condition": "minecraft:entity_properties",
        "entity": "this",
        "predicate": {
          "type_specific": {
            "type": "player",
            "gamemode": [
              "spectator"
            ]
          }
        }
      }
    },
    {
      "condition": "minecraft:value_check",
      "value": {
        "type": "minecraft:score",
        "target": {
          "type": "minecraft:fixed",
          "name": "gm4_guidebook"
        },
        "score": "load.status"
      },
      "range": {"min": 1}
    },
    {
      "condition": "minecraft:value_check",
      "value": {
        "type": "minecraft:score",
        "target": {
            "type": "minecraft:fixed",
            "name": book.load_check
        },
        "score": "load.status"
      },
      "range": {"min": 1}
    }
  ]

  # add requirements to criteria
  criteria = {k: v for k, v in all_criteria.items() if k in criteria_keys}
  for criterion in criteria.values():
    if "player" not in criterion["conditions"]:
      criterion["conditions"]["player"] = extra_player_checks
    else:
      criterion["conditions"]["player"] = [*criterion["conditions"]["player"], *extra_player_checks]

  # create advancement that rewards the function
  return Advancement({
    "parent": "gm4_guidebook:root",
    "criteria": criteria,
    "requirements": reqs,
    "rewards": {
      "function": f"gm4_guidebook:{module_id}/rewards/{section.name}",
    }
  })



"""
Creates the advancement to hide the display advancements
"""
def root_advancement() -> Advancement:
  return Advancement({
  "criteria": {
    "requirement": {
      "trigger": "minecraft:impossible",
      "conditions": {
        "player": [
          {
            "condition": "minecraft:value_check",
            "value": {
              "type": "minecraft:score",
              "target": {
                "type": "minecraft:fixed",
                "name": "gm4_guidebook"
              },
              "score": "load.status"
            },
            "range": {
              "min": 1
            }
          }
        ]
      }
    }
  }
})



"""
Creates the advancement to show the toast
"""
def generate_display_advancement(book: Book, project_id: str) -> Advancement:
  module_name = book.name
  icon = book.icon
  if icon.components is None:
    icon.components = dict()
  icon.components["minecraft:custom_model_data"] = f"{project_id}:guidebook_icon/{book.id}"
  display = {
    "icon": {
      "id": icon.id,
      "components": icon.components
    },
    "title": [
      "",
      {
        "translate": "gui.gm4.guidebook.toast",
        "fallback": "",
        "color": "white",
        "font": "gm4:guidebook"
      },
      {
        "translate": "text.gm4.guidebook.discovered_page",
        "fallback": "Check your guidebook!",
        "color": "#4AA0C7",
        "italic": True
      }
    ],
    "description": module_name, # this isn't actually ever visible
    "frame": "goal",
    "show_toast": True,
    "announce_to_chat": False,
    "hidden": True
  }
  return Advancement({
    "display": display,
    "parent": "gm4_guidebook:root",
    "criteria": {
      "impossible": {
        "trigger": "minecraft:impossible"
      }
    }
  })



"""
Creates the function that is granted when a section is unlocked
"""
def generate_reward_function(section: Section, book_id: str, book_name: str, desc: Optional[str]) -> Function:
  # check if any module needs to be loaded
  if section.enable and len(section.enable) > 0:
    start = "execute"
    for module_check in section.enable:
      if module_check["load"] == -1:
        start += " unless "
      else:
        start += " if "
      start += f"score {module_check['id']} load.status matches 1.."
    start += " run "
  else:
    start = ""
  # standard tellraw message
  tellraw: list[TextComponent] = [
    "", 
    {
      "translate": "text.gm4.guidebook.discovered", 
      "fallback":"%1$s has discovered a guidebook page from %2$s", 
      "with": [
        {
          "selector":"@s" # player
        },
        {
          "text": f"[{book_name}]", # module name (never translated)
          "color": "#4AA0C7", 
          "hoverEvent": 
          {
            "action": "show_text", 
            "contents": [
              {
                "text": book_name, # module name
                "color": "#4AA0C7"
              }, 
              {
                "text": "\n"
              }, 
              {
                "translate": f"text.gm4.guidebook.module_desc.{book_id}", # module description
                "fallback": desc,
                "italic": True, 
                "color": "gray"
              }
            ]
          }
        }
      ]
    }
  ]

  # show tellraw and toast
  reward = Function([
    f'{start}tellraw @s {json.dumps(tellraw)}',
    f"{start}advancement grant @s only gm4_guidebook:{book_id}/display/{section.name}"
  ])
  # grants other sections when this section is obtained
  if section.grants:
    reward.append([f"{start}advancement grant @s only gm4_guidebook:{book_id}/unlock/{grant}" for grant in section.grants])
  return reward



"""
Creates the function that populates the page storage
"""
def generate_setup_storage_function(pages: list[Any], lectern_pages: list[Any], book: Book, ctx: Context, overlay: bool = False) -> Function:
  populated_pages: list[str] = []
  populated_lectern: list[str] = []
  locked_pages: list[str] = []

  # setup locked storage  
  locked_title: list[dict[Any, Any]|str] = [{'insert':'title'},{'insert':'locked_text_title'}]
  locked_text: list[dict[Any, Any]|str] = [{'insert':'locked_text'}]
  locked_pages.append(stringify_page(locked_text, book, ctx, False))
  locked_pages.append(stringify_page(locked_text, book, ctx, True))
  locked_pages.append(stringify_page(locked_title, book, ctx, False))
  locked_pages.append(stringify_page(locked_title, book, ctx, True))

  # populate the inserts and stringify the pages
  for page in pages:
    populated_pages.append(stringify_page(page, book, ctx, False))
  for page in lectern_pages:
    populated_lectern.append(stringify_page(page, book, ctx, True))

  # write each command to be placed in the function
  unlocked = f"execute if score {book.load_check} load.status matches 1.. run data modify storage gm4_guidebook:pages {book.id}.pages set value {populated_pages}"
  locked = f"execute if score {book.load_check} load.status matches 1.. run data modify storage gm4_guidebook:pages {book.id}.locked set value {locked_pages}"
  lectern = f"execute if score {book.load_check} load.status matches 1.. run data modify storage gm4_guidebook:pages {book.id}.lectern set value {populated_lectern}"
  
  return Function([
    unlocked,
    locked,
    lectern
  ], tags=[] if overlay else ["gm4_guidebook:setup_storage"])


"""
Creates the function that adds a line to the table of contents
"""
def generate_add_toc_line_function(book: Book, overlay: bool = False) -> Function:
  text_component = {
    "text": get_toc_line(book),
    "color": "#4AA0C7",
    "clickEvent": {
      "action": "run_command",
      "value": f"/trigger gm4_guide set {book.trigger_id}"
    },
    "hoverEvent": {
      "action": "show_text",
      "contents": [{
        "translate": "text.gm4.guidebook.jump_to_section",
        "fallback": "Jump to Section",
        "color": "gold"
      }]
    }
  }
  return Function([
    f"execute if score $trigger gm4_guide matches {book.trigger_id} if score {book.load_check} load.status matches 1.. run data modify storage gm4_guidebook:temp page append value ' {json.dumps(text_component, ensure_ascii=False)}'"
  ], tags=[] if overlay else ["gm4_guidebook:add_toc_line"])


"""
Creates the function to summon a guidebook marker with proper NBT
"""
def generate_summon_marker_function(book: Book, overlay: bool = False) -> Function:
  marker_nbt = nbtlib.Compound()
  marker_nbt["CustomName"] = nbtlib.String(f'"gm4_{book.id}"')
  marker_nbt["Tags"] = nbtlib.List([nbtlib.String("gm4_guide"),nbtlib.String(f"gm4_guide_{book.id}")])
  marker_nbt["data"] = nbtlib.Compound()
  marker_nbt["data"]["type"] = nbtlib.String(book.module_type)
  if book.module_type == "expansion":
    marker_nbt["data"]["base"] = nbtlib.String(book.base_module)
  marker_nbt["data"]["id"] = nbtlib.String(book.id)
  marker_nbt["data"]["trigger"] = nbtlib.Int(book.trigger_id)
  marker_nbt["data"]["module_name"] = nbtlib.String(book.name)
  marker_nbt["data"]["toc_line"] = nbtlib.String(get_toc_line(book))
  marker_nbt["data"]["line_count"] = nbtlib.Int(len(split_into_lines(get_toc_line(book))))
  return Function([
    f"execute if score {book.load_check} load.status matches 1.. run summon marker ~ {get_pos_hash(book.id)} ~ {nbtlib.serialize_tag(marker_nbt)}"# type: ignore
  ], tags=[] if overlay else ["gm4_guidebook:summon_marker"])


"""
Creates the function to update the guidebook in hand
"""
def generate_update_hand_function(book: Book, overlay: bool = False) -> Function:
  start = f"execute if score @s gm4_guide matches {book.trigger_id} if score {book.load_check} load.status matches 1.. run"
  return Function([
    f"{start} loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot gm4_guidebook:{book.id}",
    f"{start} loot replace entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand loot gm4_guidebook:{book.id}"
  ], tags=[] if overlay else ["gm4_guidebook:update_hand"])


"""
Creates the function tag to update the guidebook in lecterns
"""
def generate_update_lectern_function(book: Book, overlay: bool = False) -> Function:
  start = f"execute if score $trigger gm4_guide matches {book.trigger_id} if score {book.load_check} load.status matches 1.. run"
  return Function([
    f"{start} loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/{book.id}"
  ], tags=[] if overlay else ["gm4_guidebook:update_lectern"])


"""
Creates page unlock toast texture from module icons
"""
def generate_toast_model(book: Book, ctx: Context) -> Model:
  # look for module icon
    # first looks for gm4_apple_trees:gui/guidebook/apple_trees
    # then for the pack.png
  icon = ctx.assets.textures.get(f"{ctx.project_id}:gui/guidebook/{book.id}", None)
  if not icon and ctx.data.icon and ctx.data.icon != PngFile(source_path=Path("base/pack.png")): # use pack.png of root pack if no guidebook texture given
    icon = ctx.data.icon.copy() # copy image to new file

  if not icon: # still no icon, use the guidebook book texture
    return Model({
      "parent":"gm4_guidebook:item/guidebook"
    })
  
  # round corners
  img = cast(Image.Image, icon.image) # FIXME why needs cast? # type: ignore
  mask = Image.new(mode='L', size=img.size)
  mask_draw = ImageDraw.Draw(mask)
  mask_draw.rounded_rectangle(((0,0),img.size), radius=img.size[0]//6, fill=255)
  img.putalpha(mask)
  ctx.assets[f"{ctx.project_id}:gui/guidebook/{book.id}"] = Texture(img)

  # create model for new texture
  return Model({
    "parent": "builtin/generated",
    "textures":{
      "layer0": f"{ctx.project_id}:gui/guidebook/{book.id}"
    },
    "display":{
      "gui":{
        "scale": [1.4, 1.4, 1]
      }
    }
  })



"""
Clamps a value between to valid RGB decimal numbers
"""
def clamp(x: int|float): 
  return int(max(0, min(x, 255)))



"""
Reads an texture and finds the average dominant color
"""
def get_texture_color(texture: PngFile|None) -> str:
  if texture is None:
    return "#000000"

  # Find the colors that occur most often
  palette: list[int] = texture.image.convert('P', palette=Image.ADAPTIVE, colors=4).getpalette() # type: ignore ; PIL typing is weird
  if not palette:
    return "#000000"

  # get average RGB values
  r, g, b = 0, 0, 0
  n = 0
  for i in range(0, min(12, len(palette)), 3): # type: ignore
    r += palette[i] # type: ignore ; PIL has 'Unknown' type on palette return
    g += palette[i+1] # type: ignore
    b += palette[i+2] # type: ignore
    n += 1
  if n > 0:
    r /= 4 # type: ignore
    g /= 4 # type: ignore
    b /= 4 # type: ignore

  # bump saturation and value to taste
  h, s, v = colorsys.rgb_to_hsv(r, g, b)# type: ignore
  s *= 1.5
  v *= 0.85
  r, g, b = colorsys.hsv_to_rgb(h, s, v)

  # return hex value
  return "#{0:02x}{1:02x}{2:02x}".format(clamp(r), clamp(g), clamp(b))



"""
Looks for a single texture to represent a vanilla item, even in cases where the item has a model with multiple textures
"""
def intuit_item_texture(item_id: str, vanilla: Vanilla) -> PngFile|None:
    item_textures = vanilla.mount("assets/minecraft/textures/item").assets["minecraft"].textures
    block_textures = vanilla.mount("assets/minecraft/textures/block").assets["minecraft"].textures
    item_id = item_id.removeprefix("minecraft:")

    # try invective mapping
    if (r:=item_textures.get(f"item/{item_id}")):
      return r
    elif (r:=block_textures.get(f"block/{item_id}")):
      return r
    else: # exhaustively look for a fuzzy-esque name match
      combined_textures = NamespaceContainer[Texture]()
      combined_textures.merge(item_textures)
      combined_textures.merge(block_textures)
      for id, texture in combined_textures.items():
        if f"block/{item_id}" not in id and f"item/{item_id}" not in id:
          continue
        return texture
