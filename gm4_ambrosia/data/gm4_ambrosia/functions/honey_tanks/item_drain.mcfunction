#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#honeycomb
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_ambrosia:{item:"honey_comb"}}}]} run function gm4_ambrosia:honey_tanks/item_drain_honeycomb

#bottle of honey
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_ambrosia:{item:"honey_bottle",honey_level:9}}}]} run function gm4_ambrosia:honey_tanks/item_drain_honeybottle
