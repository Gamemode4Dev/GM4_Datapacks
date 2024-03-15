# @template gm4:test_platform
# @dummy ~ ~1 ~

setblock ~1 ~1 ~1 bee_nest[honey_level=3]{Bees:[{MinOccupationTicks:100,EntityData:{id:"minecraft:bee"}}]}
give @s diamond_axe
enchant @s silk_touch

dummy @s mine ~1 ~1 ~1

tp @e[type=item,distance=..4] @s

await entity @s[nbt={Inventory:[{id:"minecraft:bee_nest",Count:1b,tag:{display:{Lore:['{"translate":"text.gm4.beehive_inspector.bees","fallback":"Bees","extra":[": ",{"text":"1","color":"gray"}],"italic":false,"color":"gray"}','{"translate":"text.gm4.beehive_inspector.honey","fallback":"Honey","extra":[": ",{"text":"3","color":"gray"}],"italic":false,"color":"gray"}']}}}]}]
