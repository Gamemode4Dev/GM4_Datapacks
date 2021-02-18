# @s = area effect cloud ray used to detect the sapling
# run from gm4_fruiting_trees:sapling/place_sapling

scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_count matches 0..500 at @s unless block ~ ~ ~ #minecraft:saplings run function gm4_fruiting_trees:sapling/ray
