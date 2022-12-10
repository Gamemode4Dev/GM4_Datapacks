from beet import Context, Function, Predicate
import json
from urllib import request

MCVERSION = "1.19.2"
CC_VERSION = "3.0"

item_tags_url = f"https://raw.githubusercontent.com/misode/mcmeta/{MCVERSION}-registries/tag/item/data.min.json"
item_tags = json.load(request.urlopen(item_tags_url))

def beet_default(ctx: Context):
  for id in item_tags:
    ctx.data[f"gm4_custom_crafters-{CC_VERSION}:vanilla_item_tags/{id}"] = Predicate({
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": {
        "equipment": {
          "mainhand": {
            "tag": f"minecraft:{id}"
          }
        }
      }
    })

  ctx.data[f"gm4_custom_crafters-{CC_VERSION}:process_input/check_item_tags"] = Function([
    "# checks each slot for item tags",
    "# @s = crafter armor stand",
    "# located at the center of the block",
    "# run from gm4_custom_crafters-3.0:process_input/check_item via #gm4_custom_crafter:custom_item_checks",
    "",
    *[f"execute if predicate gm4_custom_crafters-{CC_VERSION}:vanilla_item_tags/{id} run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.minecraft.{id} set value 1b" for id in item_tags],
  ])
