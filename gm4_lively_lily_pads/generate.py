from beet import Context, Advancement
from beet.core.utils import JsonDict
from beet.contrib.vanilla import Vanilla
from typing import Any

def beet_default(ctx: Context):
  """
  generates add_candle_rcd.json advancement
  """
  
  vanilla = ctx.inject(Vanilla)
  vanilla.minecraft_version = '1.21.5'
  item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags
  candles: list[str] = item_tags["minecraft:candles"].data["values"]

  adv: JsonDict = {
    "rewards": {
      "function": "gm4_lively_lily_pads:mechanics/interactions/add_candle/interact_rcd"
    }
  }
  or_requirement: list[str] =[]
  for candle in candles:
    added_criteria: JsonDict = {
      "criteria":{
        candle.removeprefix("minecraft:"): {
          "trigger": "minecraft:player_interacted_with_entity",
          "conditions": {
            "item": {
              "items": candle
            },
            "entity": [
              {
                "condition": "minecraft:entity_properties",
                "entity": "this",
                "predicate": {
                  "type": "minecraft:interaction",
                  "nbt": "{Tags:[\""+ f"gm4_llp_{candle.removeprefix('minecraft:')}_rcd" + "\"]}"
                }
              }
            ]
          }
        }
      },
    }
    or_requirement.append(candle.removeprefix("minecraft:"))
    adv = recursive_merge(adv,added_criteria)
  added_requirement: JsonDict = {
    "requirements": [
      or_requirement
    ]
  }
  adv = recursive_merge(adv,added_requirement)
  ctx.data["gm4_lively_lily_pads:add_candle_rcd"] = Advancement(adv)


# Source: https://www.geeksforgeeks.org/recursively-merge-dictionaries-in-python/
def recursive_merge(dict1: dict[str,Any], dict2: dict[str,Any]):
  for key, value in dict2.items(): # type: ignore
    if key in dict1 and isinstance(dict1[key], dict) and isinstance(value, dict):
      # Recursively merge nested dictionaries
      dict1[key] = recursive_merge(dict1[key], value) # type: ignore
    else:
      # Merge non-dictionary values
      dict1[key] = value
  return dict1
