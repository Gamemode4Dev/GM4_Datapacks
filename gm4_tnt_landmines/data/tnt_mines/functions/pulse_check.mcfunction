#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = tnt_mines gm4_clockTick run function tnt_mines:main

#runs commands at valid tnt mines
execute as @e[tag=gm4_tnt_mines_mine,nbt={ArmorItems:[{},{},{},{id:"minecraft:player_head"}]}] at @s run function tnt_mines:run/at_mine