#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#water bucket
execute if score @s[tag=gm4_lt_water] gm4_lt_value matches ..87 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Water Tank\"}",Items:[{Slot:0b,id:"minecraft:water_bucket"}]} run function standard_liquids:item_drain/bucket

#water bottle
execute if score @s[tag=gm4_lt_water] gm4_lt_value matches ..89 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Water Tank\"}",Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:water"}}]} run function standard_liquids:item_drain/bottle

#lava bucket
execute if score @s[tag=gm4_lt_lava] gm4_lt_value matches ..87 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Lava Tank\"}",Items:[{Slot:0b,id:"minecraft:lava_bucket"}]} run function standard_liquids:item_drain/bucket

#milk bucket
execute if score @s[tag=gm4_lt_milk] gm4_lt_value matches ..87 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Milk Tank\"}",Items:[{Slot:0b,id:"minecraft:milk_bucket"}]} run function standard_liquids:item_drain/bucket

#mushroom stew
execute if score @s[tag=gm4_lt_mushroom_stew] gm4_lt_value matches ..89 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Mushroom Stew Tank\"}",Items:[{Slot:0b,id:"minecraft:mushroom_stew"}]} run function standard_liquids:item_drain/bowl

#rabbit stew
execute if score @s[tag=gm4_lt_rabbit_stew] gm4_lt_value matches ..89 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Rabbit Stew Tank\"}",Items:[{Slot:0b,id:"minecraft:rabbit_stew"}]} run function standard_liquids:item_drain/bowl

#beetroot soup
execute if score @s[tag=gm4_lt_beetroot_soup] gm4_lt_value matches ..89 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Beetroot Soup Tank\"}",Items:[{Slot:0b,id:"minecraft:beetroot_soup"}]} run function standard_liquids:item_drain/bowl

#beetroot
execute if score @s[tag=gm4_lt_beetroot_soup] gm4_lt_value matches ..89 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Beetroot Soup Tank\"}",Items:[{Slot:0b,id:"minecraft:beetroot"}]} run function standard_liquids:item_drain/beetroot

#experience bottle
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1386 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Experience Tank\"}",Items:[{Slot:0b,id:"minecraft:experience_bottle"}]} run function standard_liquids:item_drain/experience_bottle

#enchanted book
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1391 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Experience Tank\"}",Items:[{Slot:0b,id:"minecraft:enchanted_book"}]} run function standard_liquids:item_drain/enchanted_book
