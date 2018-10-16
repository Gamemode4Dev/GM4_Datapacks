execute if block ~ ~-0.5 ~ dirt if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:grass_block"}]}] run setblock ~ ~-0.5 ~ grass_block
execute if block ~ ~-0.5 ~ farmland if block ~ ~0.5 ~ air positioned ~ ~0.5 ~ run function boots_of_ostara:plant
advancement grant @s only gm4:boots_of_ostara
