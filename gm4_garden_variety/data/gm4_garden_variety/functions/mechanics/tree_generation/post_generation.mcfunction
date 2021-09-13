# finalizes anything needed after tree generation
# @s = @e[type=marker,tag=gm4_gv_sapling,tag=gm4_TREE_TYPE_sapling]
# at @s
# run from gm4_garden_variety:mechanics/tree_generation/TREE_TYPE/generate


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "] "
tellraw @a[tag=gm4_gv_debug_generation,distance=..15] {"nbt":"path","storage":"gm4_garden_variety:debug/generation","interpret":true}
data modify storage gm4_garden_variety:debug/generation backlog prepend from storage gm4_garden_variety:debug/generation path
data remove storage gm4_garden_variety:debug/generation backlog[25]
data remove storage gm4_garden_variety:debug/generation path

# reset generation mode
scoreboard players set $generation_mode_orbis gm4_gv_tree_gen 0
scoreboard players set $generation_mode_sapling gm4_gv_tree_gen 0
scoreboard players set $generation_mode_command gm4_gv_tree_gen 0

# reset tree type
scoreboard players reset * gm4_tree_type

# kill marker
kill @s
