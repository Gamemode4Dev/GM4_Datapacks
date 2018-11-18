#@s = liquid tank with item in first slot and at least 1 space in tank
#run from standard_liquids:item_fill

#water bottle
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Water Tank\"}",Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function standard_liquids:item_fill/water_bottle

#mushroom stew
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Mushroom Stew Tank\"}",Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/mushroom_stew

#rabbit stew
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Rabbit Stew Tank\"}",Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/rabbit_stew

#beetroot soup
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Beetroot Soup Tank\"}",Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/beetroot_soup


#triples
execute if score @s gm4_lt_value matches 3.. run function standard_liquids:item_fill/triples
