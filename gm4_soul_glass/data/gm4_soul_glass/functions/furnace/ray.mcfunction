# @s = area effect cloud ray used to detect the blast furnace
# run from opened_furnace

scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_count matches 0..500 at @s unless block ~ ~ ~ blast_furnace run function gm4_soul_glass:furnace/ray
