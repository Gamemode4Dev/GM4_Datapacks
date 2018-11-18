#@s = liquid tank with item in first slot and at least 3 spaces in tank
#run from standard_liquids:item_drain/singles

#water bucket
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Water Tank\"}",Items:[{Slot:0b,id:"minecraft:water_bucket"}]} run function standard_liquids:item_drain/bucket

#lava bucket
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Lava Tank\"}",Items:[{Slot:0b,id:"minecraft:lava_bucket"}]} run function standard_liquids:item_drain/bucket

#milk bucket
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Milk Tank\"}",Items:[{Slot:0b,id:"minecraft:milk_bucket"}]} run function standard_liquids:item_drain/bucket

#more then triple

#experience bottle
execute if score @s gm4_lt_value matches ..1386 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Experience Tank\"}",Items:[{Slot:0b,id:"minecraft:experience_bottle"}]} run function standard_liquids:item_drain/experience_bottle

#enchanted book
execute if score @s gm4_lt_value matches ..1391 if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Experience Tank\"}",Items:[{Slot:0b,id:"minecraft:enchanted_book"}]} run function standard_liquids:item_drain/enchanted_book
