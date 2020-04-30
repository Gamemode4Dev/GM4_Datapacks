#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#water bucket
execute if score @s[tag=gm4_lt_water] gm4_lt_value matches 3.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bucket"}]} run function gm4_standard_liquids:item_fill/water_bucket

#water bottle
execute if score @s[tag=gm4_lt_water] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_standard_liquids:item_fill/water_bottle

#lava bucket
execute if score @s[tag=gm4_lt_lava] gm4_lt_value matches 3.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bucket"}]} run function gm4_standard_liquids:item_fill/lava_bucket

#milk bucket
execute if score @s[tag=gm4_lt_milk] gm4_lt_value matches 3.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bucket"}]} run function gm4_standard_liquids:item_fill/milk_bucket

#mushroom stew
execute if score @s[tag=gm4_lt_mushroom_stew] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bowl"}]} run function gm4_standard_liquids:item_fill/mushroom_stew

#rabbit stew
execute if score @s[tag=gm4_lt_rabbit_stew] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bowl"}]} run function gm4_standard_liquids:item_fill/rabbit_stew

#beetroot soup
execute if score @s[tag=gm4_lt_beetroot_soup] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bowl"}]} run function gm4_standard_liquids:item_fill/beetroot_soup

#experience bottle
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches 8.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_standard_liquids:item_fill/experience_bottle

#honey bottle
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_standard_liquids:item_fill/honey_bottle
