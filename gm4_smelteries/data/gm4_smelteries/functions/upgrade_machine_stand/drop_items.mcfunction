# drops items from the original hopper, drops directly above the original hopper
# @s = smeltery armor stand
# located at @s align xyz positioned ~0.5 ~0.7 ~0.5
# run from gm4_smelteries:upgrade_machine_stand

summon item ~ ~ ~ {Tags:["gm4_smeltery_item"],Item:{id:"minecraft:stick",Count:1b,tag:{gm4_smelteries:{id:"delete"}}}}
data modify entity @e[type=item,tag=gm4_smeltery_item,distance=..0.5,limit=1] Item set from storage gm4_smelteries:temp Items[-1]
kill @e[type=item,tag=gm4_smeltery_item,distance=..2,nbt={Item:{tag:{gm4_smelteries:{id:"delete"}}}}]
tag @e[type=item,distance=..0.5] remove gm4_smeltery_item
data remove storage gm4_smelteries:temp Items[-1]
execute if data storage gm4_smelteries:temp Items[-1] run function gm4_smelteries:upgrade_machine_stand/drop_items
