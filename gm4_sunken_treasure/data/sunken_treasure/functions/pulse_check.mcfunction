execute as @a if score gm4_st_sand matches 1.. if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] at @s if block ~ ~ ~ water if block ~ ~1 ~ water if block ~ ~2 ~ water if block ~ ~3 ~ water if block ~ ~4 ~ water run function sunken_treasure:check_treasure
execute as @a if score gm4_st_sand matches 1.. run scoreboard players reset @s gm4_st_sand
