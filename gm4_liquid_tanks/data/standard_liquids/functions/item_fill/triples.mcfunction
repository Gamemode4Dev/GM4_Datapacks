#@s = liquid tank with item in first slot and at least 3 spaces in tank
#run from standard_liquids:item_fill/singles

#water bucket
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Water Tank\"}",Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/water_bucket

#lava bucket
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Lava Tank\"}",Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/lava_bucket

#milk bucket
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Milk Tank\"}",Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/milk_bucket


#more then triple

#experience bottle
execute if score @s gm4_lt_value matches 8.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Experience Tank\"}",Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function standard_liquids:item_fill/experience_bottle
