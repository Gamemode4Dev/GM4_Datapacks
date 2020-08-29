scoreboard objectives add gm4_dimension dummy

execute in minecraft:overworld unless block 29999998 1 7133 birch_wall_sign run function gm4_forceload-1.0:init_chunk

execute as @a at @s run function gm4_forceload-1.0:check_dimension
