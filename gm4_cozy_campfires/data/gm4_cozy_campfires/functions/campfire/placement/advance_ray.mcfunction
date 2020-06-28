# @s = area effect cloud ray used to detect a campfire
# at @s
# run from gm4_cozy_campfires:place/cast_ray

scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_count matches 0..500 at @s unless block ~ ~ ~ #minecraft:campfires run function gm4_cozy_campfires:campfire/placement/advance_ray
