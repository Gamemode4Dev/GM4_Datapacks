# generates the roots
# @s = @e[type=marker,tag=gm4_gv_rooting_marker]
# at @s
# run from gm4_garden_variety:mechanics/soil_rooting/rooting_spreader


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "."

# correct offset
execute if score $soil_rooting_loop gm4_gv_tree_gen = $soil_rooting_root_length gm4_gv_tree_gen run tp @s ^ ^ ^1

# generate roots
execute at @s run function #gm4_garden_variety:mechanics/soil_rooting/place_block

# move forward
execute at @s run tp @s ^ ^ ^1

# [Loop]
scoreboard players remove $soil_rooting_loop gm4_gv_tree_gen 1
execute if score $soil_rooting_loop gm4_gv_tree_gen matches 0 run kill @s[type=!player]
execute if score $soil_rooting_loop gm4_gv_tree_gen matches 1.. run function gm4_garden_variety:mechanics/soil_rooting/soil_rooter
