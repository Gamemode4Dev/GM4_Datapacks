#@s = liquid tank with item in first slot and at least 3 spaces in tank
#run from standard_liquids:item_drain/singles

#water bucket
execute if entity @s[tag=gm4_lt_water] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:water_bucket"}]} run function standard_liquids:item_drain/bucket


#lava bucket
execute if entity @s[tag=gm4_lt_lava] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:lava_bucket"}]} run function standard_liquids:item_drain/bucket

#milk bucket
execute if entity @s[tag=gm4_lt_milk] if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:milk_bucket"}]} run function standard_liquids:item_drain/bucket
