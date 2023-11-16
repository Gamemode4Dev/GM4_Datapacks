from beet import Function, Advancement, LootTable, Context, FunctionTag
import nbtlib
from typing import TypedDict, Any
import json
import os

# TODO:
# parse & update page contents
# delete old files
# setup system for lecterns
# display advancement description
# reward tellraw hover text (same as above)
# merge some functions to reduce fuction call overhead


class Section(TypedDict):
  name: str
  pages: list[str]
  pages_locked: list[str]
  enable: list[dict[str, int]]
  requirements: list[list[str]]
  grants: list[str]


class Book(TypedDict):
  id: str
  name: str
  module_type: str
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


def generate_book_header(book_dict: Book) -> str:
  wiki_id = book_dict["name"].replace(" ", "_")
  header = [
    "",
    {
      "text": "⌂",
      "color": "#3D83A3",
      "bold": True,
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide set 1"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "text": "Return to the table of contents"
        }
      }
    },
    " " * 6,
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
          "text": "Open the wiki page for this module"
        }
      }
    },
    " " * 6,
    {
      "text": "⟳",
      "bold": True,
      "color": "gold",
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide set {book_dict['trigger_id']}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "text": "Refresh section"
        }
      }
    },
    " " * 3,
    {
      "text": "◀",
      "clickEvent": {
        "action": "run_command",
        "value": f"/trigger gm4_guide_prev set {book_dict['trigger_id']}"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "text": "Go to the previous module"
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
          "text": "Go to the next module"
        }
      }
    },
    "\\n",
    {
      "text": book_dict["name"],
      "underlined": True,
      "color": "#4AA0C7"
    },
    "\\n"
  ]
  return f"{header}"

def generate_lectern_header(book_dict: Book) -> str:
  wiki_id = book_dict["name"].replace(" ", "_")
  header = [
    "",
    {
      "text": "⌂",
      "color": "#3D83A3",
      "bold": True,
      "clickEvent": {
        "action": "change_page",
        "value": f"2"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "text": "Return to the table of contents"
        }
      }
    },
    " " * 6,
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
          "text": "Open the wiki page for this module"
        }
      }
    },
    " " * 6,
    {
      "text": "⟳",
      "bold": True,
      "color": "gold",
      "clickEvent": {
        "action": "change_page",
        "value": f"3"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "text": "Refresh section"
        }
      }
    },
    " " * 3,
    {
      "text": "◀",
      "clickEvent": {
        "action": "change_page",
        "value": f"4"
      },
      "hoverEvent": {
        "action": "show_text",
        "value": {
          "text": "Go to the previous module"
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
          "text": "Go to the next module"
        }
      }
    },
    "\\n",
    {
      "text": book_dict["name"],
      "underlined": True,
      "color": "#4AA0C7"
    },
    "\\n"
  ]
  return f"{header}"


advances = json.load(open("temp/advances.json"))


def char_advance(str: str) -> int:
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


def generate_loottable(book_dict: Book) -> tuple[LootTable, LootTable, list[str], list[str]]:
  book_id = book_dict["id"]
  sections = book_dict["sections"]
  page_storage:list[str] = []
  fallback_storage:list[str] = []

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
      page_storage.append(f'{page}')

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
        fallback_storage.append(f'{page}')
       
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
      "range": 2
    },
    {
      "condition": "minecraft:value_check",
      "value": {
        "type": "minecraft:score",
        "target": {
            "type": "minecraft:fixed",
            "name": f"gm4_{module_id}"
        },
        "score": "load.status"
      },
      "range": {"min": 1, "max": 2147483647}
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
      "text": "Check your guidebook!",
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


def generate_setup_storage_function(pages: list[str], pages_locked: list[str], book_dict: Book) -> Function:
  unlocked = f"execute if score gm4_{book_dict['id']} load.status matches 1.. run data modify storage gm4_guidebook:pages {book_dict['id']}.pages set value {pages}"
  unlocked = unlocked.replace("{'insert': 'header'}",generate_book_header(book_dict))

  locked_text = "{'text':'???','hoverEvent':{'action':'show_text','contents':[{'translate':'text.gm4.guidebook.undiscovered','fallback':'Undiscovered','italic':true,'color':'red'}]}}"
  locked = f"execute if score gm4_{book_dict['id']} load.status matches 1.. run data modify storage gm4_guidebook:pages {book_dict['id']}.pages_locked set value {pages_locked}"
  locked = locked.replace("{'insert': 'header'}",generate_book_header(book_dict))
  locked = locked.replace("{'insert': 'locked_text'}",locked_text)

  if (len(pages_locked) > 0):
    lectern_pages:list[str] = [pages[0],pages_locked[0]]
  else:
    lectern_pages:list[str] = [pages[0],""]
  lectern = f"execute if score gm4_{book_dict['id']} load.status matches 1.. run data modify storage gm4_guidebook:pages {book_dict['id']}.lectern set value {lectern_pages}"
  lectern = lectern.replace("{'insert': 'header'}",generate_lectern_header(book_dict))
  lectern = lectern.replace("{'insert': 'locked_text'}",locked_text)
  
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
    f"execute if score $trigger gm4_guide matches {book['trigger_id']} if score gm4_{book['id']} load.status matches 1.. run data modify storage gm4_guidebook:temp page append value ' {json.dumps(text_component, ensure_ascii=False)}'"
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
  marker_nbt["data"]["toc_lines"] = nbtlib.Int(len(split_into_lines(get_toc_line(book))))
  return Function([
    f"execute if score gm4_{book['id']} load.status matches 1.. run summon marker ~ {get_pos_hash(book['id'])} ~ {nbtlib.serialize_tag(marker_nbt)}"
  ])


def generate_update_hand_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/update_hand"for book_id in book_ids
    ]
  })


def generate_update_hand_function(book: Book, load: str) -> Function:
  start = f"execute if score @s gm4_guide matches {book['trigger_id']} if score {load} load.status matches 1.. run"
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


def generate_update_lectern_function(book: Book, load: str) -> Function:
  start = f"execute if score $trigger gm4_guide matches {book['trigger_id']} if score {load} load.status matches 1.. run"
  return Function([
    f"{start} loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/{book['id']}"
  ])


def beet_default(ctx: Context):
  if not os.path.exists(f"{ctx.directory}/data/gm4_guidebook"):
    return

  book_ids: list[Any] = []
  for file in os.listdir(f"{ctx.directory}/data/gm4_guidebook/"):
    if not file.endswith(".json"):
      continue

    book = json.load(open(f"{ctx.directory}/data/gm4_guidebook/{file}"))

    # get trigger id, generate one if not already existing
    triggers = json.load(open("gm4_guidebook/triggers.json"))
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

    book_ids.append(book["id"] if "id" in book else file[:-5])

    loottable, lectern_loot, pages, pages_locked = generate_loottable(book)
    ctx.data[f"gm4_guidebook:{book['id']}"] = loottable
    ctx.data[f"gm4_guidebook:lectern/{book['id']}"] = lectern_loot

    ctx.data[f"gm4_guidebook:{book['id']}/add_toc_line"] = generate_add_toc_line_function(book)
    ctx.data[f"gm4_guidebook:{book['id']}/setup_storage"] = generate_setup_storage_function(
      pages, pages_locked, book)
    ctx.data[f"gm4_guidebook:{book['id']}/summon_marker"] = generate_summon_marker_function(book)
    ctx.data[f"gm4_guidebook:{book['id']}/update_hand"] = generate_update_hand_function(book, ctx.project_id)
    ctx.data[f"gm4_guidebook:{book['id']}/update_lectern"] = generate_update_lectern_function(book, ctx.project_id)

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
