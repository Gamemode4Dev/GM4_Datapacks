#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#water bucket
execute if score @s[tag=gm4_lt_water] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:water_bucket"}]} run function gm4_standard_liquids:item_drain/bucket

#water bottle
execute if score @s[tag=gm4_lt_water] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:water"}}]} run function gm4_standard_liquids:item_drain/bottle

#lava bucket
execute if score @s[tag=gm4_lt_lava] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:lava_bucket"}]} run function gm4_standard_liquids:item_drain/bucket

#milk bucket
execute if score @s[tag=gm4_lt_milk] gm4_lt_value matches ..297 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:milk_bucket"}]} run function gm4_standard_liquids:item_drain/bucket

#mushroom stew
execute if score @s[tag=gm4_lt_mushroom_stew] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:mushroom_stew"}]} run function gm4_standard_liquids:item_drain/bowl

#rabbit stew
execute if score @s[tag=gm4_lt_rabbit_stew] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:rabbit_stew"}]} run function gm4_standard_liquids:item_drain/bowl

#beetroot soup
execute if score @s[tag=gm4_lt_beetroot_soup] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:beetroot_soup"}]} run function gm4_standard_liquids:item_drain/bowl

#beetroot
execute if score @s[tag=gm4_lt_beetroot_soup] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:beetroot"}]} run function gm4_standard_liquids:item_drain/beetroot

#16x compressed experience bottle (block compressors)
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1251 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:experience_bottle",tag:{gm4_compressed:{value:16}}}]} run function gm4_standard_liquids:item_drain/experience_bottle_16x

#64x compressed experience bottle (block compressors)
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..819 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:experience_bottle",tag:{gm4_compressed:{value:64}}}]} run function gm4_standard_liquids:item_drain/experience_bottle_64x

#experience bottle
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1386 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:experience_bottle"}]} unless block ~ ~ ~ hopper{Items:[{Slot:0b,tag:{gm4_compressed:{}}}]} run function gm4_standard_liquids:item_drain/experience_bottle

#enchanted book
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1388 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:enchanted_book"}]} run function gm4_standard_liquids:item_drain/enchanted_book

#enchanted page (book binders)
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1390 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:paper",tag:{gm4_book_binders:{item:"enchanted_page"}}}]} run function gm4_standard_liquids:item_drain/enchanted_page

#honey bottle
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches ..399 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:honey_bottle"}]} run function gm4_standard_liquids:item_drain/bottle

#honey block
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches ..396 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:honey_block"}]} run function gm4_standard_liquids:item_drain/honey_block
