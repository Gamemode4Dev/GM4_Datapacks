scoreboard players add ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score ray_counter gm4_count matches 0..500 at @s unless block ~ ~ ~ #trapped_signs:signs run function trapped_signs:ray
