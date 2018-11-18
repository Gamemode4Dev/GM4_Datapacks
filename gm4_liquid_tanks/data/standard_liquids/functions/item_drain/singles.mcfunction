#@s = liquid tank with item in first slot and at least 1 space in tank
#run from standard_liquids:item_drain

#water bottle
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Water Tank\"}",Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:water"}}]} run function standard_liquids:item_drain/bottle

#mushroom stew
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Mushroom Stew Tank\"}",Items:[{Slot:0b,id:"minecraft:mushroom_stew"}]} run function standard_liquids:item_drain/bowl

#rabbit stew
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Rabbit Stew Tank\"}",Items:[{Slot:0b,id:"minecraft:rabbit_stew"}]} run function standard_liquids:item_drain/bowl

#beetroot soup
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Beetroot Soup Tank\"}",Items:[{Slot:0b,id:"minecraft:beetroot_soup"}]} run function standard_liquids:item_drain/bowl

#beetroot
execute if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Beetroot Soup Tank\"}",Items:[{Slot:0b,id:"minecraft:beetroot"}]} run function standard_liquids:item_drain/beetroot

execute if score @s gm4_lt_value matches ..87 run function standard_liquids:item_drain/triples
