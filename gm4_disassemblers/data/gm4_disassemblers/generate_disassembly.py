import json
import urllib.request
import itertools
import beet

print("Generating disassembly loot tables...")

diamond_items = ["minecraft:diamond_sword","minecraft:diamond_pickaxe","minecraft:diamond_axe","minecraft:diamond_shovel","minecraft:diamond_hoe","minecraft:diamond_helmet","minecraft:diamond_chestplate","minecraft:diamond_leggings","minecraft:diamond_boots"]
diamond_durability = [1562, 1562, 1562, 1562, 1562, 364, 529, 496, 430]
iron_items = ["minecraft:iron_sword","minecraft:iron_pickaxe","minecraft:iron_axe","minecraft:iron_shovel","minecraft:iron_hoe","minecraft:iron_helmet","minecraft:iron_chestplate","minecraft:iron_leggings","minecraft:iron_boots"]
iron_durability = [251, 251, 251, 251, 251, 166, 241, 226, 196]
gold_items = ["minecraft:golden_sword","minecraft:golden_pickaxe","minecraft:golden_axe","minecraft:golden_shovel","minecraft:golden_hoe","minecraft:golden_helmet","minecraft:golden_chestplate","minecraft:golden_leggings","minecraft:golden_boots"]
gold_durability = [33, 33, 33, 33, 33, 78, 113, 106, 92]
leather_items = ["minecraft:leather_helmet","minecraft:leather_chestplate","minecraft:leather_leggings","minecraft:leather_boots"]
leather_durability = [56, 81, 76, 66]
other_items = ["minecraft:turtle_helmet","minecraft:bow","minecraft:crossbow","minecraft:shears","minecraft:fishing_rod","minecraft:flint_and_steel"]
other_durability = [276, 385, 466, 239, 65, 65]
normal_items = diamond_items + iron_items + gold_items + leather_items + other_items
normal_durability = diamond_durability + iron_durability + gold_durability + leather_durability + other_durability
special_items = ["minecraft:shield"]
special_durability = [337]

recipes_url = "https://raw.githubusercontent.com/InventivetalentDev/minecraft-assets/1.19.2/data/minecraft/recipes/_all.json"
recipes = json.load(urllib.request.urlopen(recipes_url))

pairs = {}

for i, item in enumerate(normal_items):
  print(item)
  recipe = recipes[item.split(":")[1]]
  if recipe["type"] == "minecraft:crafting_shaped":
    pattern = ''
    for row in recipe["pattern"]:
      if len(row) < 2: row = " " + row
      if len(row) < 3: row = row + " "
      pattern = pattern + row
    while (len(pattern) < 9):
      pattern = pattern + " "
    pattern = ["".join(g) for k, g in itertools.groupby(pattern)]
    # for j, patternx in enumerate(pattern):
    #   if patternx != " " and  len(patternx) != 1:
    #     pattern[j] = [patternx[0]]*len(patternx)
    pattern = [item for sublist in pattern for item in sublist]
    recipe["key"][" "] = {"item": "minecraft:air"}
    pattern = [(recipe["key"][p[0]]["item"], len(p)) for p in pattern]
  else:
    pattern = []
    for ingredient in recipe["ingredients"]:
      pattern.append((ingredient["item"], 1))
    if len(pattern) < 9:
      pattern.append(("minecraft:air", 9-len(pattern)))

  pools = []
  for p in pattern:
    base = {"rolls": p[1], "entries": [{"type": "minecraft:item", "name": p[0]}]}
    if p[0] == "minecraft:air":
      pools.append(base)
      continue
    base["entries"][0]["conditions"] = [{
      "condition":"value_check",
      "value":{
        "type":"score",
        "target":{
          "type":"fixed",
          "name":"$damage"
        },
        "score":"gm4_disassembler"
      },
      "range":{
        "min":0,
        "max":{
          "type":"uniform",
          "min":0,
          "max":normal_durability[i]
        }
      }
    }]
    pools.append({"rolls": p[1], "entries": [{"type": "minecraft:alternatives", "children": [base["entries"][0],{"type": "minecraft:item", "name": "minecraft:air"}]}]})
  
  lootTable = {
    "type": "minecraft:generic",
    "pools": pools
  }

  with open("gm4_disassemblers/data/gm4_disassemblers/loot_tables/disassembleables/"+item.split(":")[1]+".json", "w+") as file:
    json.dump(lootTable, file, indent=2)

# lengths = {}
# for item in normal_items + special_items:
#   if str(len(item)) not in lengths:
#     lengths[str(len(item))] = []
#   lengths[str(len(item))].append(item)

# for length in lengths:
#   with open("gm4_disassemblers/data/gm4_disassemblers/functions/disassembleables/"+ length + ".mcfunction", "w+") as file:
#     for item in lengths[length]:
#       if "diamond" in item:
#         file.write('execute if score disassemble_diamonds gm4_disassembler matches 1 if data storage gm4_disassemblers:temp Items[{"id":"' + item +'"}] run loot replace block ~ ~ ~ container.0 loot gm4_disassemblers:disassembleables/'+item.split(":")[1] + "\n")
#       else: 
#         file.write('execute if data storage gm4_disassemblers:temp Items[{"id":"' + item +'"}] run loot replace block ~ ~ ~ container.0 loot gm4_disassemblers:disassembleables/'+item.split(":")[1] + "\n")

caller = {"type": "minecraft:generic","pools":[{"rolls":1,"entries":[{"type":"minecraft:alternatives","children":[]}]}]}  
for item in normal_items:
  caller["pools"][0]["entries"][0]["children"].append(
    {
      "type": "minecraft:loot_table",
      "name": f'gm4_disassemblers:disassembleables/{item.split(":")[1]}',
      "conditions":[{
        "condition":"entity_properties",
        "entity": "this",
            "predicate": {
              "equipment": {
                "mainhand": {
                  "items": [item]
                }
              }
            }
      }]})
  if item in diamond_items:
    caller["pools"][0]["entries"][0]["children"][-1]["conditions"].append({"condition":"value_check","range":1,"value":{"type":"score","target":{"type":"fixed","name":"disassemble_diamonds"},"score":"gm4_disassembler"}})
with open("gm4_disassemblers/data/gm4_disassemblers/loot_tables/caller.json", "w+") as file:
  json.dump(caller, file, indent=2)
