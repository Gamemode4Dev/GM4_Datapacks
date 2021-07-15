# @s = marker ray used to detect the sapling
# run from gm4_fruiting_trees:sapling/place_sapling

# check blocks around the marker ray
scoreboard players set $found gm4_count 0
execute store success score $found gm4_count align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_fruiting_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}

# move forward
scoreboard players add $ray gm4_count 1
tp @s ^ ^ ^0.01
execute if score $ray gm4_count matches 0..500 at @s unless score $found gm4_count matches 1 run function gm4_fruiting_trees:sapling/ray
