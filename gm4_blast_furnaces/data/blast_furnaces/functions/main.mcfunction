# Here is where all the main functions reside in


execute as @e[type=armor_stand,tag=gm4_bf_output] at @s run function blast_furnaces:process

scoreboard players reset @a[scores={gm4_bf_placed_i=1..}] gm4_bf_placed_i
scoreboard players reset @a[scores={gm4_bf_placed_f=1..}] gm4_bf_placed_f
