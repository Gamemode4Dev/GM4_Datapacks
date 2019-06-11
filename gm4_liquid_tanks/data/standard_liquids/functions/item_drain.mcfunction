#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process


execute if score @s gm4_lt_value matches ..299 run function standard_liquids:item_drain/singles

#experience bottle
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1386 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:experience_bottle"}]} run function standard_liquids:item_drain/experience_bottle

#enchanted book
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1391 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:enchanted_book"}]} run function standard_liquids:item_drain/enchanted_book
