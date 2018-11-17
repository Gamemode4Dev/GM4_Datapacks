#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#water bucket
execute if score @s gm4_lt_value matches 3.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Water Tank\"}",Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/water_bucket

#water bottle
execute if score @s gm4_lt_value matches 1.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Water Tank\"}",Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function standard_liquids:item_fill/water_bottle

#lava bucket
execute if score @s gm4_lt_value matches 3.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Lava Tank\"}",Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/lava_bucket

#milk bucket
execute if score @s gm4_lt_value matches 3.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Milk Tank\"}",Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/milk_bucket

#mushroom stew
execute if score @s gm4_lt_value matches 1.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Mushroom Stew Tank\"}",Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/mushroom_stew

#rabbit stew
execute if score @s gm4_lt_value matches 1.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Rabbit Stew Tank\"}",Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/rabbit_stew

#beetroot soup
execute if score @s gm4_lt_value matches 1.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Beetroot Soup Tank\"}",Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/beetroot_soup

#experience bottle
execute if score @s gm4_lt_value matches 8.. if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Experience Tank\"}",Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function standard_liquids:item_fill/experience_bottle
