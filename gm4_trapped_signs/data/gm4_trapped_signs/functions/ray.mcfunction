# @s = area effect cloud ray used to detect the sign
# run from both place_trapped_sign and place_secret_trapped_sign

scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_count matches 0..500 at @s unless block ~ ~ ~ #minecraft:all_signs run function gm4_trapped_signs:ray
