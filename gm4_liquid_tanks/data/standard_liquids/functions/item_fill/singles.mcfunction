#@s = liquid tank with item in first slot and at least 1 space in tank
#run from standard_liquids:item_fill


#water bottle
execute if entity @s[tag=gm4_lt_water] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function standard_liquids:item_fill/water_bottle

#mushroom stew
execute if entity @s[tag=gm4_lt_mushroom_stew] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/mushroom_stew

#rabbit stew
execute if entity @s[tag=gm4_lt_rabbit_stew] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/rabbit_stew

#beetroot soup
execute if entity @s[tag=gm4_lt_beetroot_soup] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bowl"}]} run function standard_liquids:item_fill/beetroot_soup


#triples
execute if score @s gm4_lt_value matches 3.. run function standard_liquids:item_fill/triples
