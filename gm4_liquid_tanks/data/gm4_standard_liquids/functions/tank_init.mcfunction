#@s = empty liquid tank with item in first slot or entity on top
#run from liquid_tanks:item_process

#water
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:water_bucket"}]} run function gm4_standard_liquids:liquid_init/water

execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:water"}}]} run function gm4_standard_liquids:liquid_init/water

#lava
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:lava_bucket"}]} run function gm4_standard_liquids:liquid_init/lava

#milk
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:milk_bucket"}]} run function gm4_standard_liquids:liquid_init/milk

#mushroom stew
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:mushroom_stew"}]} run function gm4_standard_liquids:liquid_init/mushroom_stew

#rabbit stew
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:rabbit_stew"}]} run function gm4_standard_liquids:liquid_init/rabbit_stew

#beetroot soup
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:beetroot_soup"}]} run function gm4_standard_liquids:liquid_init/beetroot_soup

execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:beetroot"}]} run function gm4_standard_liquids:liquid_init/beetroot_soup

#experience
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:experience_bottle"}]} run function gm4_standard_liquids:liquid_init/experience

execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:enchanted_book"}]} run function gm4_standard_liquids:liquid_init/experience

#honey
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:honey_bottle"}]} run function gm4_standard_liquids:liquid_init/honey

execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:honey_block"}]} run function gm4_standard_liquids:liquid_init/honey
