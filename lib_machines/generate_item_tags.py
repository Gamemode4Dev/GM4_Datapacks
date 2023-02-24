from beet import Context, Function, Predicate
from beet.contrib.vanilla import Vanilla

MCVERSION = "1.19.2"
CC_VERSION = "3.0"


def beet_default(ctx: Context):
  """Creates a predicate for every vanilla item tag and a function checking all of these predicates."""
  vanilla = ctx.inject(Vanilla)
  item_tags = vanilla.data.item_tags
  item_tags = [id.removeprefix("minecraft:") for id in item_tags]

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
    f"# run from gm4_custom_crafters-{CC_VERSION}:process_input/check_item via #gm4_custom_crafter:custom_item_checks",
    "",
    *[f"execute if predicate gm4_custom_crafters-{CC_VERSION}:vanilla_item_tags/{id} run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.minecraft.{id} set value 1b" for id in item_tags],
  ])
