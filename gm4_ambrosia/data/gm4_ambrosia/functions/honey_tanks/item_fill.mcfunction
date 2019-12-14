#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#honey bottle
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_ambrosia:honey_tanks/item_fill_bottle

#honey beetroot
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:beetroot"}]} unless block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:beetroot",tag:{gm4_ambrosia:{item:"honey_beetroot"}}}]} run function gm4_ambrosia:honey_tanks/item_fill_beet
