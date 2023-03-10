from beet import Function, Advancement, LootTable, Context, FunctionTag
import nbtlib
import copy
from typing import TypedDict
import json
import os


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
  criteria: dict[str, dict]
  sections: list[Section]
  trigger_id: int


def get_pos_hash(module_id):
  id = module_id.replace("_", "")
  n = []
  for l in id:
    n.append(ord(l) - 96)
  while len(n) < 11:
    n.append(0)
  id = sum(n[i] * (27 ** (10 - i)) for i in range(11)) / 1000000000000
  return id


def generate_loottable(book_dict: Book) -> tuple[LootTable, list[str], list[str]]:
  book_id = book_dict["id"]
  sections = book_dict["sections"]
  page_storage = []
  fallback_storage = []

  functions = [{
    "function": "minecraft:set_nbt",
    "tag": "{CustomModelData:3420001,gm4_guidebook:1b,title:\"Gamemode 4 Guidebook\",author:Unknown,generation:3,pages:[]}"
  }]

  for section in sections:
    enable_conditions = []

    for module_check in section["enable"]:
      condition = {
        "condition": "minecraft:value_check",
        "value": {
           "type": "minecraft:score",
           "target": {
               "type": "minecraft:fixed",
               "name": module_check["id"]
           },
           "score": "load.status"
            },
        "range": module_check["load"] if module_check["load"] > 0 else {"min": 0, "max": 2147483647}
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
            f"gm4_guidebook:{book_id}/{section['name']}": True
          }
        }
      }
    }

    enabled_ops = []
    fallback_ops = []
    for page in section["pages"]:
      enabled_ops.append({
        "op": "append",
        "source": f"{book_id}.pages[{len(page_storage)}]",
        "target": "pages"
      })
      page_storage.append(page)

    if "pages_locked" in section:
      for page in section["pages_locked"]:
        fallback_ops.append({
          "op": "append",
          "source": f"{book_id}.pages_locked[{len(fallback_storage)}]",
          "target": "pages"
        })
        fallback_storage.append(page)
    else:
      fallback_default = {
        "op": "append",
        "source": f"locked_default",
        "target": "pages"
      }
      fallback_ops = [fallback_default] * len(enabled_ops)

    function = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": f"gm4_guidebook:pages"
      },
      "ops": enabled_ops,
      "conditions": [*enable_conditions]
    }
    fallback_function = {
      "function": "minecraft:copy_nbt",
      "source": {
        "type": "minecraft:storage",
        "source": f"gm4_guidebook:pages"
      },
      "ops": fallback_ops,
      "conditions": [*enable_conditions]
    }

    if "requirements" in section and len(section["requirements"]) > 0:
      function["conditions"].append(unlock_condition)
      fallback_function["conditions"].append({"condition": "minecraft:inverted", "term": unlock_condition})
      functions.append(function)
      functions.append(fallback_function)
    else:
      functions.append(function)

  return LootTable({
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
  }), page_storage, fallback_storage


def generate_advancement(book: Book, section_index: int) -> Advancement | None:
  section: Section = book["sections"][section_index]
  module_name = book["name"]
  module_id = book["id"]
  icon = book["icon"]
  all_criteria = book["criteria"]
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
  criteria_keys: set[str] = set()
  for requirement in section["requirements"]:
    for criterion in requirement:
      assert(criterion in all_criteria)
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
            "name": module_id
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
    "display": display,
    "parent": "gm4_guidebook:root",
    "criteria": criteria,
    "requirements": section["requirements"],
    "rewards": {
      "function": f"gm4_guidebook:rewards/{module_id}/{section['name']}",
    } if "grants" in section else {}
  })


def generate_display_advancement(book: Book, section_index: int) -> Advancement:

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


def generate_reward_function(section: Section, book_id: str) -> Function:
  reward = Function([
    f"advancement grant @s only gm4_gudebook:{book_id}/display/{section['name']}"
  ])
  if "grant" in section:
    reward.append([f"advancement grant @s only gm4_guidebook:{book_id}/{grant}" for grant in section["grants"]])
  return reward


def generate_setup_storage_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/setup_storage" for book_id in book_ids
    ]
  })


def generate_setup_storage_function(pages: list[str], pages_locked: list[str], module_id: str) -> Function:
  return Function([
    f"data modify storage gm4_guidebook:pages {module_id}.pages set value {pages}",
    f"data modify storage gm4_guidebook:pages {module_id}.pages_locked set value {pages_locked}"
  ])


def generate_add_toc_line_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/add_toc_line"for book_id in book_ids
    ]
  })


def generate_add_toc_line_function(book: Book) -> Function:
  return Function([
    f"data modufy"
  ])


def generate_summon_marker_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/summon_marker"for book_id in book_ids
    ]
  })


def generate_summon_marker_function(book: Book) -> Function:
  marker_nbt = nbtlib.Compound()
  marker_nbt["CustomName"] = nbtlib.String(f"gm4_{book['id']}")
  marker_nbt["Tags"] = nbtlib.List([nbtlib.String("gm4_guide")])
  marker_nbt["data"] = nbtlib.Compound()
  marker_nbt["data"]["type"] = nbtlib.String(book["module_type"])
  marker_nbt["data"]["id"] = nbtlib.String(book["id"])
  marker_nbt["data"]["trigger"] = nbtlib.Int(book["trigger_id"])
  marker_nbt["data"]["module_name"] = nbtlib.String(book["name"])
  return Function([
    f"summon marker ~ {get_pos_hash(book['id'])} ~ {nbtlib.serialize_tag(marker_nbt)}"
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
    f"{start} run loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot gm4_guidebook:{book['id']}",
    f"{start} run loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot gm4_guidebook:{book['id']}"
  ])


def generate_update_lectern_tag(book_ids: list[str]) -> FunctionTag:
  return FunctionTag({
    "values": [
      f"gm4_guidebook:{book_id}/update_lectern"for book_id in book_ids
    ]
  })


def generate_update_lectern_function(book: Book, load: str) -> Function:
  start = f"execute if score @s gm4_guide matches {book['trigger_id']} if score {load} load.status matches 1.. run"
  return Function([
    f"{start} run loot spawn ~ ~-3000 ~ loot gm4_guidebook:gm4_guidebook:{book['id']}"
  ])


def beet_default(ctx: Context):
  if not os.path.exists(f"{ctx.directory}/data/gm4_guidebook"):
    return
  book_ids = []
  for file in os.listdir(f"{ctx.directory}/data/gm4_guidebook/"):
    if not file.endswith(".json"):
      continue

    book = json.load(open(f"{ctx.directory}/data/gm4_guidebook/{file}"))
    book_ids.append(book["id"] if "id" in book else file[:-5])

    loottable, pages, pages_locked = generate_loottable(book)
    ctx.data[f"gm4_gudebook:{book['id']}"] = loottable

    ctx.data[f"gm4_gudebook:{book['id']}/add_toc_line"] = generate_add_toc_line_function(book)
    ctx.data[f"gm4_gudebook:{book['id']}/setup_storage"] = generate_setup_storage_function(
      pages, pages_locked, book["id"])
    ctx.data[f"gm4_gudebook:{book['id']}/summon_marker"] = generate_summon_marker_function(book)
    ctx.data[f"gm4_gudebook:{book['id']}/update_hand"] = generate_update_hand_function(book, ctx.project_id)
    ctx.data[f"gm4_gudebook:{book['id']}/update_lectern"] = generate_update_lectern_function(book, ctx.project_id)

    for index, section in enumerate(book["sections"]):
      if (advancement := generate_advancement(book, index)) is not None:
        ctx.data[f"gm4_gudebook:{book['id']}/unlock/{section['name']}"] = advancement
        ctx.data[f"gm4_gudebook:{book['id']}/display/{section['name']}"] = advancement
        ctx.data[f"gm4_gudebook:{book['id']}/rewards/{section['name']}"] = generate_reward_function(section, book["id"])

  ctx.data["gm4_gudebook:add_toc"] = generate_add_toc_line_tag(book_ids)
  ctx.data["gm4_gudebook:summon_marker"] = generate_summon_marker_tag(book_ids)
  ctx.data["gm4_gudebook:update_hand"] = generate_update_hand_tag(book_ids)
  ctx.data["gm4_gudebook:update_lectern"] = generate_update_lectern_tag(book_ids)
  ctx.data["gm4_gudebook:setup_storage"] = generate_setup_storage_tag(book_ids)
