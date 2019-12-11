execute as @a[advancements={boots_of_ostara:enable_boots=true}] at @s run function boots_of_ostara:active
execute as @e[type=armor_stand,nbt={HandItems:[{id:"minecraft:grass_block"}],ArmorItems:[{id:"minecraft:leather_boots",tag:{gm4_boots_of_ostara:1b}}]}] at @s if block ~ ~-0.5 ~ dirt run setblock ~ ~-0.5 ~ grass_block

schedule function boots_of_ostara:main 16t
