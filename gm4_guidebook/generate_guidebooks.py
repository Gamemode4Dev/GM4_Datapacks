from beet import Function, Advancement, LootTable, Context, FunctionTag
from beet.contrib.vanilla import Vanilla
import nbtlib, colorsys
from PIL import Image
from typing import TypedDict, Any
import json, yaml
import os

# TODO:
# update page contents
# delete old files
# recipe support
# merge some functions to reduce fuction call overhead


class Section(TypedDict):
  name: str
  pages: list[dict[Any, Any] | list[dict[Any, Any]]]
  pages_locked: list[dict[Any, Any] | list[dict[Any, Any]]]
  enable: list[dict[str, int]]
  requirements: list[list[str]]
  grants: list[str]


class Book(TypedDict):
  id: str
  name: str
  module_type: str
  load_check: str
  base_module: str
  icon: dict[str, str]
  criteria: dict[str, dict[Any, Any]]
  sections: list[Section]
  trigger_id: int
  description: str


def get_pos_hash(module_id: str):
  id = module_id.replace("_", "")
  n:list[int] = []
  for l in id:
    n.append(ord(l) - 96)
  while len(n) < 11:
    n.append(0)
  id = sum(n[i] * (27 ** (10 - i)) for i in range(11)) / 1000000000000
  return id


def generate_book_header(book_dict: Book) -> list[dict[Any, Any]|str]:
  wiki_id = book_dict["name"].replace(" ", "_")
  header: list[dict[Any, Any]|str] = [
    "",
    {
      "text": "↖⌂",
      "color": "#3D83A3",
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide set 1"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.return_to_toc",
          "fallback": "Return to the table of contents"
        }
      }
    },
    " ",
    {
      "text": "Ⓦ",
      "color": "#864bc7",
      "clickEvent": {
        "action": "open_url",
        "value": f"https://wiki.gm4.co/wiki/{wiki_id}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.open_wiki",
          "fallback": "Open the wiki page for this module"
        }
      }
    },
    " " * 14,
    {
      "text": "⟳",
      "bold": True,
      "color": "dark_green",
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide set {book_dict['trigger_id']}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.refresh",
          "fallback": "Refresh section"
        }
      }
    },
    " ",
    {
      "text": "◀",
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide_prev set {book_dict['trigger_id']}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.prev",
          "fallback": "Go to the previous module"
        }
      }
    },
    " ",
    {
      "text": "▶",
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide_next set {book_dict['trigger_id']}"
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
      "text": book_dict["name"],
      "underlined": True,
      "color": "#4AA0C7"
    },
    "\n"
  ]
  return header

def generate_lectern_header(book_dict: Book) -> list[dict[Any, Any]|str]:
  wiki_id = book_dict["name"].replace(" ", "_")
  header: list[dict[Any, Any]|str] = [
    "",
    {
      "text": "↖⌂",
      "color": "#3D83A3",
      "clickEvent": {
        "action": "change_page",
        "value": f"2"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.return_to_toc",
          "fallback": "Return to the table of contents"
        }
      }
    },
    " ",
    {
      "text": "Ⓦ",
      "color": "#864bc7",
      "clickEvent": {
        "action": "open_url",
        "value": f"https://wiki.gm4.co/wiki/{wiki_id}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.open_wiki",
          "fallback": "Open the wiki page for this module"
        }
      }
    },
    " " * 14,
    {
      "text": "⟳",
      "bold": True,
      "color": "dark_green",
      "clickEvent": {
        "action": "change_page",
        "value": f"3"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.refresh",
          "fallback": "Refresh section"
        }
      }
    },
    " ",
    {
      "text": "◀",
      "clickEvent": {
        "action": "change_page",
        "value": f"4"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "translate": "text.gm4.guidebook.prev",
          "fallback": "Go to the previous module"
        }
      }
    },
    " ",
    {
      "text": "▶",
      "clickEvent": {
        "action": "change_page",
        "value": f"1"
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
      "text": book_dict["name"],
      "underlined": True,
      "color": "#4AA0C7"
    },
    "\n"
  ]
  return header



def loottable_to_display(loottable: str, vanilla: Vanilla) -> dict[Any, Any]:
  # find loot table file
  path_pieces = loottable.split(":")
  loot_dir = f"data/{path_pieces[0]}/loot_tables"
  item = path_pieces[1].split("/")[-1]
  target_file = f"{loot_dir}/{path_pieces[1]}.json"
  target_path = ""
  for root, subdirs, files in os.walk('./'):
    if loot_dir not in root or len(subdirs) != 0 or ("./gm4_" not in root and "./lib_" not in root):
      continue
    for file in files:
      path = f"{root}/{file}"
      if target_file in path:
        target_path = path
  if target_path == "":
    raise ValueError(f"File not found: {loottable}")

  # open loot table file
  with open(target_path) as f:
    loot: dict[Any, Any] = json.load(f)
  if len(loot["pools"]) > 1:
    raise ValueError("Loot table has multiple pools")
  if len(loot["pools"][0]["entries"]) > 1:
    raise ValueError("Loot table has multiple entries")
  if "item" not in loot["pools"][0]["entries"][0]["type"]:
    raise ValueError("Loot table does not return an item")
  
  # get item id, name, lore, and color
  entry: dict[Any, Any] = loot["pools"][0]["entries"][0]
  item_id: str = entry["name"]
  tag: dict[Any, Any] = {}
  name: str = ""
  lore: list[str] = []
  if "functions" in entry:
    for function in entry["functions"]:
      if "set_name" in function["function"]:
        name = f'{json.dumps(function["name"])}'
      elif "set_lore" in function["function"]:
        for line in function["lore"]:
          lore.append(f'{json.dumps(line)}')
      elif "set_nbt" in function["function"]:
        tag: dict[Any, Any] = nbtlib.parse_nbt(function["tag"])
  # color
  if "player_head" in item_id and "$" in tag["SkullOwner"]:
    skull_owner = tag["SkullOwner"].replace("$","")
    path_pieces = target_path.split('/')
    skin_path = ""
    for piece in path_pieces:
      if piece == "loot_tables":
        break
      skin_path += f"{piece}/"
    skin_path += f"skins/{skull_owner}.png"
    color = get_item_color(skin_path, vanilla, True)
  else:
    color = get_item_color(item_id, vanilla)

  # create slot
  slot: dict[Any, Any] = {
    "translate": "gm4.second",
    "fallback": "%1$s",
    "with": [
      {
        "text": "☒",
        "color": color
      },
      {
        "translate": f"text.gm4.guidebook.crafting.display.{item.replace(':','.')}",
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
  display_name = ""
  display_lore = ""
  if name != "":
    display_name = f"Name:'{name}'"
  if len(lore) > 0:
    display_lore = f"Lore:{lore}"
  if display_name != "" or display_lore != "":
    display_tag = "{display:{" + display_name + "," + display_lore + "}}"
    slot["hoverEvent"]["contents"]["tag"] = f"{display_tag}"
  return slot


def generate_recipe_display(recipe: str, vanilla: Vanilla) -> list[dict[Any, Any]|str]:
  module = recipe.split(":")[0]
  for file in os.listdir(f"{module}/data/gm4_custom_crafters/"):
    if not file.endswith(".json"):
      continue

    # get recipe JSON
    with open(f"{module}/data/gm4_custom_crafters/{file}") as recipes_file:
      recipes: list[dict[Any, Any]] = json.load(recipes_file)
    r = None
    for next_recipe in recipes:
      if next_recipe["name"] == recipe:
        r = next_recipe
    if r is None:
      raise KeyError(f'Unknown recipe: {recipe}')
    
    # get recipe ingredients
    ingredients:list[dict[Any, Any]] = []
    # shaped
    if r["input"]["type"] == "shaped":
      input:list[str] = ["", "", ""]
      input = r["input"]["recipe"]
      while len(input) < 3:
        input.append("   ")
      for i in range(3):
        while len(input[i]) < 3:
          input[i] += " "
      # convert input into list of ingredients
      for i in range(3):
        for j in range(3):
          ingredient = input[i][j]
          item = {}
          if ingredient == " ":
            item["id"] = "empty"
          else:
            if isinstance(r["input"]["key"][ingredient], list):
              if "guidebook" in r["input"]["key"][ingredient][0]:
                item["display"] = r["input"]["key"][ingredient][0]["guidebook"]
              else:
                item["id"] = r["input"]["key"][ingredient][0]["item"]
                if "nbt" in r["input"]["key"][ingredient][0]:
                  item["tag"] = r["input"]["key"][ingredient][0]["nbt"].replace("'",'\"')
            else:
              if "guidebook" in r["input"]["key"][ingredient]:
                item["display"] = r["input"]["key"][ingredient]["guidebook"]
              else:
                item["id"] = r["input"]["key"][ingredient]["item"]
                if "nbt" in r["input"]["key"][ingredient]:
                  item["tag"] = r["input"]["key"][ingredient]["nbt"].replace("'",'\"')
          ingredients.append(item)
    # shapeless
    elif r["input"]["type"] == "shapeless":
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
    d_ingredients: list[dict[Any, Any]|str] = []
    for ingredient in ingredients:
      if "id" in ingredient and ingredient["id"] == "empty":
        # show empty slot ()
        slot = {
          "translate": "text.gm4.guidebook.crafting.display.empty_slot",
          "fallback": "☐"
        }
      else:
        # show filled slot (colored with a hover event)
        if "display" in ingredient and "loot_table" in ingredient["display"]["type"]:
          slot = loottable_to_display(ingredient["display"]["name"], vanilla)
        else:
          if "display" in ingredient and "item" in ingredient["display"]["type"]:
            item = ingredient["display"]["name"]
          else:
            item = ingredient["id"]
          color = get_item_color(item, vanilla)
          slot: dict[Any, Any] = {
            "translate": "gm4.second",
            "fallback": "%1$s",
            "with": [
              {
                "text": "☒",
                "color": color
              },
              {
                "translate": f"text.gm4.guidebook.crafting.display.{item.replace(':','.')}",
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
      d_ingredients.append(slot)
    
    # get recipe results
    if "type" in r["output"]:
      output_type = r["output"]["type"]
    else:
      output_type = "normal"
    
    res: dict[Any, Any] = {}
    if output_type == "normal":
      res = r["output"]["result"]
    elif output_type == "special":
      res = r["output"]["guidebook"]
    elif output_type == "replace":
      print('output type "replace" is not yet implemented') # TODO: support replace output type
    else:
      raise ValueError(f"Unknown output type: '{output_type}'")
    
    if output_type == "replace":
      results:list[dict[Any, Any]] = []
      margin = " " * 4
      display = [
        margin,
        d_ingredients[0],
        d_ingredients[1],
        d_ingredients[2],
        margin,
        results[0],
        results[1],
        results[2],
        "\n",
        margin,
        d_ingredients[3],
        d_ingredients[4],
        d_ingredients[5],
        " → ",
        results[3],
        results[4],
        results[5],
        "\n",
        margin,
        d_ingredients[6],
        d_ingredients[7],
        d_ingredients[8],
        margin,
        results[6],
        results[7],
        results[8]
      ]
    else:
      res_count: int = 1
      if "count" in res.keys():
        res_count = res["count"]
      if "item" in res["type"]:
        item = res["name"]
        result = color = get_item_color(item, vanilla)
        slot: dict[Any, Any] = {
          "translate": "gm4.second",
          "fallback": "%1$s",
          "with": [
            {
              "text": "☒",
              "color": color
            },
            {
              "translate": f"text.gm4.guidebook.crafting.display.{item.replace(':','.')}",
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
        if "tag" in res:
          slot["hoverEvent"]["contents"]["tag"] = res['tag']
        result = slot
      else:
        result = loottable_to_display(res["name"], vanilla)
      margin = " " * 6
      display = [
        margin,
        d_ingredients[0],
        d_ingredients[1],
        d_ingredients[2],
        "\n",
        margin,
        d_ingredients[3],
        d_ingredients[4],
        d_ingredients[5],
        " → ",
        result,
        "\n",
        margin,
        d_ingredients[6],
        d_ingredients[7],
        d_ingredients[8],
      ]
    return display

  return [""]



def char_advance(str: str) -> int:
  with open("gm4_guidebook/advances.json") as advances_file:
    advances = json.load(advances_file)
  if str in advances:
    if type(advances[str]) == dict:
      return advances[str]["unicode"]
    return advances[str]
  return 6


def split_into_lines(str: str) -> list[int]:
  lines:list[Any] = []
  words:list[Any] = []
  for word in str.split(" "):
    wlen = 0
    for char in word:
      wlen += char_advance(char)
    words.append((word, wlen))

  current_line = ""
  current_len = 0
  for word, wlen in words:
    if current_len + wlen > 114:
      if not current_line == "":
        lines.append(current_line)
      current_line = ""
      current_len = 0
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

  lines.append(current_line)
  for i in range(len(lines)):
    lines[i] = lines[i].removesuffix(" ")

  return lines


def get_toc_line(book_dict: Book) -> str:
  indent = "  ● " if book_dict["module_type"] == "expansion" else "● "
  return f"{indent}{book_dict['name']}"


def generate_loottable(book_dict: Book) -> tuple[LootTable, LootTable, list[Any], list[Any]]:
  book_id = book_dict["id"]
  sections = book_dict["sections"]
  page_storage:list[Any] = []
  fallback_storage:list[Any] = []

  functions:list[dict[Any, Any]] = [
    {
      "function": "minecraft:set_nbt",
      "tag": "{CustomModelData:3420001,gm4_guidebook:{lectern:0b, trigger:" + str(book_dict['trigger_id']) + "},title:\"Gamemode 4 Guidebook\",author:Unknown,generation:3,pages:[]}"
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

  functions_lectern:list[dict[Any, Any]] = [
    {
    "function": "minecraft:set_nbt",
    "tag": "{CustomModelData:3420001,gm4_guidebook:{lectern:1b, trigger:" + str(book_dict['trigger_id']) + "},title:\"Gamemode 4 Guidebook\",author:Unknown,generation:3,pages:[]}"
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
    },
    {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": "gm4_guidebook:pages"
      },
      "ops": [
        {
          "source": "lectern_front_matter[]",
          "target": "pages",
          "op": "append"
        }
      ]
    }
  ]

  for i, section in enumerate(sections):
    enable_conditions:list[dict[Any, Any]] = []

    for module_check in section["enable"]:
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
        "range": module_check["load"]
      }
      if module_check["load"] <= 0:
        condition = {"condition": "minecraft:inverted", "term": condition}
      enable_conditions.append(condition)

    unlock_condition = {
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": {
        "type_specific": {
          "type": "player",
          "advancements": {
            f"gm4_guidebook:{book_id}/unlock/{section['name']}": True
          }
        }
      }
    }

    lock_condition = {
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": {
        "type_specific": {
          "type": "player",
          "advancements": {
            f"gm4_guidebook:{book_id}/unlock/{section['name']}": False
          }
        }
      }
    }

    enabled_ops:list[dict[Any, Any]] = []
    fallback_ops:list[dict[Any, Any]] = []
    for page in section["pages"]:
      enabled_ops.append({
        "op": "append",
        "source": f"{book_id}.pages[{len(page_storage)}]",
        "target": "pages"
      })
      page_storage.append(page)

    enabled_ops_lectern = enabled_ops.copy()
    if (i == 0):
      enabled_ops_lectern[0] = {
        "op": "append",
        "source": f"{book_id}.lectern[0]",
        "target": "pages"
      }

    if "pages_locked" in section:
      for page in section["pages_locked"]:
        fallback_ops.append({
          "op": "append",
          "source": f"{book_id}.pages_locked[{len(fallback_storage)}]",
          "target": "pages"
        })
        fallback_storage.append(page)
       
      fallback_ops_lectern = fallback_ops.copy()
      if (i == 0):
        fallback_ops_lectern[0] = {
          "op": "append",
          "source": f"{book_id}.lectern[1]",
          "target": "pages"
        }
    else:
      fallback_default = {
        "op": "append",
        "source": f"locked_default",
        "target": "pages"
      }
      fallback_ops = [fallback_default] * len(enabled_ops)
      fallback_ops_lectern = fallback_ops.copy()

    function: dict[Any, Any] = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": f"gm4_guidebook:pages"
      },
      "ops": enabled_ops,
      "conditions": [*enable_conditions]
    }
    fallback_function: dict[Any, Any] = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": f"gm4_guidebook:pages"
      },
      "ops": fallback_ops,
      "conditions": [*enable_conditions]
    }

    function_lectern: dict[Any, Any] = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": f"gm4_guidebook:pages"
      },
      "ops": enabled_ops_lectern,
      "conditions": [*enable_conditions]
    }
    fallback_function_lectern: dict[Any, Any] = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": f"gm4_guidebook:pages"
      },
      "ops": fallback_ops_lectern,
      "conditions": [*enable_conditions]
    }
    
    if "requirements" in section and len(section["requirements"]) > 0:
      function["conditions"].append(unlock_condition)
      fallback_function["conditions"].append(lock_condition)
      functions.append(function)
      functions.append(fallback_function)

      function_lectern["conditions"].append(unlock_condition)
      fallback_function_lectern["conditions"].append(lock_condition)
      functions_lectern.append(function_lectern)
      functions_lectern.append(fallback_function_lectern)
    else:
      functions.append(function)
      functions_lectern.append(function_lectern)
  functions_lectern.append({
    "function": "minecraft:copy_nbt",
    "source": {
      "type": "minecraft:storage",
      "source": "gm4_guidebook:pages"
    },
    "ops": [
      {
        "source": "blank",
        "target": "pages",
        "op": "append"
      }
    ]
  })

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

  return hand_loot, lectern_loot, page_storage, fallback_storage

def populate_insert(element: dict[Any, Any], book: Book, vanilla: Vanilla, lectern: bool = False) -> dict[Any, Any] | list[dict[Any,Any]|str]:
  if "insert" in element.keys():
    if element["insert"] == "header":
      if lectern:
        return generate_lectern_header(book)
      return generate_book_header(book)
    elif element["insert"] == "locked_text":
      locked_text = {'text':'???','hoverEvent':{'action':'show_text','contents':[{'translate':'text.gm4.guidebook.undiscovered','fallback':'Undiscovered','italic':True,'color':'red'}]}}
      return locked_text
    elif element["insert"] == "recipe":
      return generate_recipe_display(element["recipe"], vanilla)
    else:
      raise ValueError(f'Unknown insert type: {element["insert"]}')
  return element


def stringify_page(page: dict[Any, Any] | list[dict[Any,Any]|str] | str, book: Book, vanilla: Vanilla, lectern: bool = False) -> str:
  if isinstance(page, dict):
    if "insert" in page.keys():
      page = populate_insert(page, book, vanilla, lectern)
  elif isinstance(page, list):
    for i, element in enumerate(page):
      if isinstance(element, dict) and "insert" in element.keys():
        page[i] = populate_insert(element, book, vanilla, lectern) #type: ignore
  return f'{json.dumps(page)}'

def generate_advancement(book: Book, section_index: int) -> Advancement | None:
  section: Section = book["sections"][section_index]
  module_id = book["id"]
  all_criteria = book["criteria"]
  criteria_keys: set[str] = set()
  for requirement in section["requirements"]:
    for criterion in requirement:
      criteria_keys.add(criterion)
  if len(criteria_keys) == 0:
    return None

  extra_player_checks = [
    {
      "condition": "minecraft:inverted",
      "term": {
        "condition": "minecraft:entity_properties",
        "entity": "this",
        "predicate": {
          "type_specific": {
            "type": "player",
            "gamemode": "spectator"
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
            "name": book["load_check"]
        },
        "score": "load.status"
      },
      "range": {"min": 1}
    }
  ]

  criteria = {k: v for k, v in all_criteria.items() if k in criteria_keys}
  for criterion in criteria.values():
    if "player" not in criterion["conditions"]:
      criterion["conditions"]["player"] = extra_player_checks
    else:
      criterion["conditions"]["player"] = [*criterion["conditions"]["player"], *extra_player_checks]

  return Advancement({
    "parent": "gm4_guidebook:root",
    "criteria": criteria,
    "requirements": section["requirements"],
    "rewards": {
      "function": f"gm4_guidebook:{module_id}/rewards/{section['name']}",
    }
  })


def generate_display_advancement(book: Book) -> Advancement:
  module_name = book["name"]
  icon = book["icon"]
  display = {
    "icon": icon,
    "title": {
      "translate": "text.gm4.guidebook.discovered_page",
      "fallback": "Check your guidebook!",
      "color": "#4AA0C7",
      "italic": True
    },
    "description": module_name,
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


def generate_reward_function(section: Section, book_id: str, book_name: str, desc: str) -> Function:
  if "enable" in section and len(section["enable"]) > 0:
    start = "execute"
    for module_check in section["enable"]:
      if module_check["load"] == -1:
        start += f" unless "
      else:
        start += f" if "
      start += f"score {module_check['id']} load.status matches 1.."
    start += " run "
  else:
    start = ""
  tellraw: list[dict[Any, Any] | str] = [
    "", 
    {
      "translate": "text.gm4.guidebook.discovered", 
      "fallback":"%1$s has discovered a guidebook page from %2$s", 
      "with": [
        {
          "selector":"@s"
        },
        {
          "text": f"[{book_name}]", 
          "color": "#4AA0C7", 
          "hoverEvent": 
          {
            "action": "show_text", 
            "contents": [
              {
                "text": book_name, 
                "color": "#4AA0C7"
              }, 
              {
                "text": "\n"
              }, 
              {
                "text": desc, 
                "italic": True, 
                "color": "gray"
              }
            ]
          }
        }
      ]
    }
  ]

  reward = Function([
    f'{start}tellraw @s {json.dumps(tellraw)}',
    f"{start}advancement grant @s only gm4_guidebook:{book_id}/display/{section['name']}"
  ])
  if "grants" in section:
    reward.append([f"{start}advancement grant @s only gm4_guidebook:{book_id}/{grant}" for grant in section["grants"]])
  return reward


def generate_setup_storage_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/setup_storage" for book_id in book_ids
    ]
  })


def generate_setup_storage_function(pages: list[Any], pages_locked: list[Any], book_dict: Book, vanilla: Vanilla) -> Function:
  populated_pages: list[str] = []
  populated_pages_locked: list[str] = []
  if (len(pages_locked) > 0):
    lectern_pages:list[str] = [stringify_page(pages[0].copy(), book_dict, vanilla, True),stringify_page(pages_locked[0].copy(), book_dict, vanilla, True)]
  else:
    lectern_pages:list[str] = [stringify_page(pages[0].copy(), book_dict, vanilla, True),""]
  for page in pages:
    populated_pages.append(stringify_page(page, book_dict, vanilla))
  for page in pages_locked:
    populated_pages_locked.append(stringify_page(page, book_dict, vanilla))

  unlocked = f"execute if score {book_dict['load_check']} load.status matches 1.. run data modify storage gm4_guidebook:pages {book_dict['id']}.pages set value {populated_pages}"
  locked = f"execute if score {book_dict['load_check']} load.status matches 1.. run data modify storage gm4_guidebook:pages {book_dict['id']}.pages_locked set value {populated_pages_locked}"

  lectern = f"execute if score {book_dict['load_check']} load.status matches 1.. run data modify storage gm4_guidebook:pages {book_dict['id']}.lectern set value {lectern_pages}"
  
  return Function([
    unlocked,
    locked,
    lectern
  ])


def generate_add_toc_line_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/add_toc_line"for book_id in book_ids
    ]
  })


def generate_add_toc_line_function(book: Book) -> Function:
  text_component = {
    "text": get_toc_line(book),
    "color": "#4AA0C7",
    "clickEvent": {
      "action": "run_command",
      "value": f"/trigger gm4_guide set {book['trigger_id']}"
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
    f"execute if score $trigger gm4_guide matches {book['trigger_id']} if score {book['load_check']} load.status matches 1.. run data modify storage gm4_guidebook:temp page append value ' {json.dumps(text_component, ensure_ascii=False)}'"
  ])


def generate_summon_marker_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/summon_marker"for book_id in book_ids
    ]
  })


def generate_summon_marker_function(book: Book) -> Function:
  marker_nbt = nbtlib.Compound()
  marker_nbt["CustomName"] = nbtlib.String(f'"gm4_{book["id"]}"')
  marker_nbt["Tags"] = nbtlib.List([nbtlib.String("gm4_guide")])
  marker_nbt["data"] = nbtlib.Compound()
  marker_nbt["data"]["type"] = nbtlib.String(book["module_type"])
  if book["module_type"] == "expansion":
    marker_nbt["data"]["base"] = nbtlib.String(book["base_module"])
  marker_nbt["data"]["id"] = nbtlib.String(book["id"])
  marker_nbt["data"]["trigger"] = nbtlib.Int(book["trigger_id"])
  marker_nbt["data"]["module_name"] = nbtlib.String(book["name"])
  marker_nbt["data"]["toc_line"] = nbtlib.String(get_toc_line(book))
  marker_nbt["data"]["line_count"] = nbtlib.Int(len(split_into_lines(get_toc_line(book))))
  return Function([
    f"execute if score {book['load_check']} load.status matches 1.. run summon marker ~ {get_pos_hash(book['id'])} ~ {nbtlib.serialize_tag(marker_nbt)}"# type: ignore
  ])


def generate_update_hand_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/update_hand"for book_id in book_ids
    ]
  })


def generate_update_hand_function(book: Book) -> Function:
  start = f"execute if score @s gm4_guide matches {book['trigger_id']} if score {book['load_check']} load.status matches 1.. run"
  return Function([
    f"{start} loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot gm4_guidebook:{book['id']}",
    f"{start} loot replace entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand loot gm4_guidebook:{book['id']}"
  ])


def generate_update_lectern_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/update_lectern"for book_id in book_ids
    ]
  })


def generate_update_lectern_function(book: Book) -> Function:
  start = f"execute if score $trigger gm4_guide matches {book['trigger_id']} if score {book['load_check']} load.status matches 1.. run"
  return Function([
    f"{start} loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/{book['id']}"
  ])

def clamp(x: int|float): 
  return max(0, min(x, 255))

def get_item_color(item: str, vanilla: Vanilla, skin: bool = False) -> str:
  paletted = None
  if skin:
    with Image.open(item) as img:
      paletted = img.convert('P', palette=Image.ADAPTIVE, colors=4) # type: ignore
  else:
    if "minecraft:" in item:
      item = item[10:]
    textures = vanilla.mount("assets/minecraft/textures").assets["minecraft"].textures
    for id, texture in textures.items():
      if f"block/{item}" not in id and f"item/{item}" not in id:
        continue
      img = (texture.image) # type: ignore
      paletted = img.convert('P', palette=Image.ADAPTIVE, colors=4) # type: ignore

  # Find the colors that occur most often
  if paletted == None:
    return "#000000"
  palette = paletted.getpalette() # type: ignore
  if palette is None:
    return "#000000"
  
  # get average RGB values
  r, g, b = 0, 0, 0
  for i in range(0, 12, 3):
    r += palette[i] # type: ignore
    g += palette[i+1] # type: ignore
    b += palette[i+2] # type: ignore
  r /= 4 # type: ignore
  g /= 4 # type: ignore
  b /= 4 # type: ignore

  # bump saturation and value
  h, s, v = colorsys.rgb_to_hsv(r, g, b)# type: ignore
  s *= 1.5
  v *= 0.85
  r, g, b = colorsys.hsv_to_rgb(h, s, v)

  # return hex value
  return "#{0:02x}{1:02x}{2:02x}".format(clamp(int(r)), clamp(int(g)), clamp(int(b)))



def beet_default(ctx: Context):
  if not os.path.exists(f"{ctx.directory}/data/gm4_guidebook"):
    return

  book_ids: list[Any] = []
  for file in os.listdir(f"{ctx.directory}/data/gm4_guidebook/"):
    if not file.endswith(".json"):
      continue

    with open(f"{ctx.directory}/data/gm4_guidebook/{file}") as book_file:
      book: Book = json.load(book_file)
    
    # get trigger id, generate one if not already existing
    with open("gm4_guidebook/triggers.json") as triggers_file:
      triggers: dict[Any, Any] = json.load(triggers_file)
    if book['id'] not in triggers:
      with open("gm4_guidebook/triggers.json", "w") as t:
        triggers[book['id']] = triggers['__next__']
        triggers['__next__'] += 1
        t.write(json.dumps(triggers, indent=2, sort_keys=True))
        t.write("\n")
    book['trigger_id'] = triggers[book['id']]

    # get description
    if "description" not in book:
      book["description"] = ctx.meta["gm4"]["website"]["description"]

    # get load check
    if "load_check" not in book:
      book['load_check'] = book['id']
    if "gm4_" not in book['load_check']:
      book['load_check'] = f"gm4_{book['load_check']}"

    book_ids.append(book["id"] if "id" in book else file[:-5])

    loottable, lectern_loot, pages, pages_locked = generate_loottable(book)
    ctx.data[f"gm4_guidebook:{book['id']}"] = loottable
    ctx.data[f"gm4_guidebook:lectern/{book['id']}"] = lectern_loot

    ctx.data[f"gm4_guidebook:{book['id']}/add_toc_line"] = generate_add_toc_line_function(book)
    ctx.data[f"gm4_guidebook:{book['id']}/setup_storage"] = generate_setup_storage_function(
      pages, pages_locked, book, ctx.inject(Vanilla))
    ctx.data[f"gm4_guidebook:{book['id']}/summon_marker"] = generate_summon_marker_function(book)
    ctx.data[f"gm4_guidebook:{book['id']}/update_hand"] = generate_update_hand_function(book)
    ctx.data[f"gm4_guidebook:{book['id']}/update_lectern"] = generate_update_lectern_function(book)

    for index, section in enumerate(book["sections"]):
      if (advancement := generate_advancement(book, index)) is not None:
        ctx.data[f"gm4_guidebook:{book['id']}/unlock/{section['name']}"] = advancement
        ctx.data[f"gm4_guidebook:{book['id']}/display/{section['name']}"] = generate_display_advancement(book)
        ctx.data[f"gm4_guidebook:{book['id']}/rewards/{section['name']}"] = generate_reward_function(
          section, book["id"], book["name"], book["description"])

  ctx.data["gm4_guidebook:add_toc_line"] = generate_add_toc_line_tag(book_ids)
  ctx.data["gm4_guidebook:summon_marker"] = generate_summon_marker_tag(book_ids)
  ctx.data["gm4_guidebook:update_hand"] = generate_update_hand_tag(book_ids)
  ctx.data["gm4_guidebook:update_lectern"] = generate_update_lectern_tag(book_ids)
  ctx.data["gm4_guidebook:setup_storage"] = generate_setup_storage_tag(book_ids)
