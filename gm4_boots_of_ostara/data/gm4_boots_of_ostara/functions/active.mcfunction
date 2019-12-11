execute if block ~ ~-0.5 ~ dirt if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:grass_block"}]}] run setblock ~ ~-0.5 ~ grass_block
execute if block ~ ~-0.5 ~ soul_sand if block ~ ~0.5 ~ air positioned ~ ~0.5 ~ if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:nether_wart"}]}] run function gm4_boots_of_ostara:plant/nether_wart
execute if block ~ ~-0.5 ~ farmland if block ~ ~0.5 ~ air positioned ~ ~0.5 ~ run function gm4_boots_of_ostara:plant
advancement grant @s only gm4:boots_of_ostara

execute as @s[nbt=!{Inventory:[{Slot:100b,id:"minecraft:leather_boots",tag:{gm4_boots_of_ostara:1b}}]}] run advancement revoke @s only gm4_boots_of_ostara:enable_boots
