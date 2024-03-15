from beet import Context, BlockTag, LootTable

TYPES = [
  "acacia",
  "bamboo",
  "birch",
  "cherry",
  "crimson",
  "dark_oak",
  "jungle",
  "mangrove",
  "oak",
  "spruce",
  "warped",
]

def beet_default(ctx: Context):
  """Generate loot tables and block tags for each sign type"""
  
  for type in TYPES:
    for hanging in [True, False]:
      for secret in [True, False]:
        item = f"{type}_{'hanging_' if hanging else ''}sign"
        name = f"{'secret_' if secret else ''}trapped_{item}"

        ctx.meta["gm4"].setdefault("model_data", []).append(
          {
            "item": item,
            "reference": f"item/{name}",
            "template": {
              "name": "trapped_signs:sign_overlay",
              "hanging": hanging
            }
          }
        )

        ctx.data[f"{ctx.project_id}:items/{name}"] = LootTable({
          "pools": [{
            "rolls": 1,
            "entries": [{
              "type": "minecraft:item",
              "name": f"minecraft:{item}",
              "functions": [
                {
                  "function": "minecraft:set_nbt",
                  "tag": f"{'{'}CustomModelData:'item/{name}',gm4_{'secret_' if secret else ''}trapped_sign:1b,HideFlags:1,Enchantments:[{'{'}id:'minecraft:protection',lvl:0s{'}'}]{'}'}"
                },
                {
                  "function": "minecraft:set_name",
                  "name": {
                    "translate": f"item.gm4.trapped_sign{'.secret' if secret else ''}",
                    "fallback": f"{'Secret ' if secret else ''}Trapped %s",
                    "with": [{ "translate": f"block.minecraft.{item}" }],
                    "italic": False
                  }
                }
              ]
            }]
          }]
        })

        ctx.data[f"{ctx.project_id}:crafting/{name}"] = LootTable({
          "type": "minecraft:generic",
          "pools": [
            {
              "rolls": 8,
              "entries": [{
                "type": "minecraft:item",
                "name": "minecraft:air"
              }]
            },
            {
              "rolls": 1,
              "entries": [{
                "type": "minecraft:loot_table",
                "name": f"gm4_trapped_signs:items/{name}",
                "functions": [{
                  "function": "minecraft:set_count",
                  "count": 1
                }]
              }]
            }
          ]
        })

  for type in TYPES:
    for hanging in [True, False]:
      ctx.data[f"{ctx.project_id}:{type}_{'hanging_' if hanging else ''}signs"] = BlockTag({
        "values": [
          f"{type}_{'hanging_' if hanging else ''}sign",
          f"{type}_wall_{'hanging_' if hanging else ''}sign"
        ]
      })
