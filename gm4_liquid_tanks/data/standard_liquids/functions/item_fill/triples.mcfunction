#@s = liquid tank with item in first slot and at least 3 spaces in tank
#run from standard_liquids:item_fill/singles

#water bucket
execute if entity @s[tag=gm4_lt_water] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/water_bucket

#lava bucket
execute if entity @s[tag=gm4_lt_lava] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/lava_bucket

#milk bucket
execute if entity @s[tag=gm4_lt_milk] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bucket"}]} run function standard_liquids:item_fill/milk_bucket


#more then triple

#experience bottle
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches 8.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function standard_liquids:item_fill/experience_bottle
