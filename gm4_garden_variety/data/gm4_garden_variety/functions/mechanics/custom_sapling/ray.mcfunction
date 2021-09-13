# raycast 5 blocks
# @s = @e[type=marker,tag=gm4_tree_ray]
# at @s
# run from gm4_garden_variety:mechanics/custom_sapling/place


# check blocks around the marker ray
scoreboard players set $found gm4_gv_tree_gen 0
execute store success score $found gm4_gv_tree_gen align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_gv_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}

# move forward
scoreboard players add $ray gm4_gv_tree_gen 1
tp @s ^ ^ ^0.01
execute if score $ray gm4_gv_tree_gen matches 0..500 at @s unless score $found gm4_gv_tree_gen matches 1 run function gm4_garden_variety:mechanics/custom_sapling/ray
