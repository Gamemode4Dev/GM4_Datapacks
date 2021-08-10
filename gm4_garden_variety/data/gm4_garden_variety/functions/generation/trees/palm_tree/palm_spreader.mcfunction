# spawns the tree's palm markers
# @s = TREE_TYPE palm spreader AEC marker
# run from gm4_garden_variety:generation/trees/palm_tree/leaf


### INITIALIZE ###

# debug 
execute if score $palm_spreader_loop gm4_gv_gen_data = $adjusted_palm_amount gm4_gv_gen_data run data modify storage gm4_garden_variety:debug/generation path append value "PS>"
data modify storage gm4_garden_variety:debug/generation path append value "P"

# update variables for layer
function gm4_garden_variety:generation/interpret_variables/layer/palm_spreader


### GENERATE ###

# get input palm variables 
function #gm4_garden_variety:generation/trees/palm_tree/palm_variables

# set rotation from variables
execute store result entity @s Rotation[0] float 1 run scoreboard players get $palm_rot_mod gm4_gv_gen_data

# set scores for the next part of generation
scoreboard players operation $palm_layer_loop gm4_gv_gen_data = $palm_layers gm4_gv_gen_data
scoreboard players set $current_palm_layer gm4_gv_gen_data 1

# summon palm marker and begin generation
execute at @s run summon marker ~ ~ ~ {Tags:["gm4_tree_palm"]}
execute at @s run tp @e[type=marker,tag=gm4_tree_palm,limit=1,sort=nearest] @s
execute as @e[type=marker,tag=gm4_tree_palm,limit=1,sort=nearest] at @s run function gm4_garden_variety:generation/trees/palm_tree/palm



# loop function until spreader_loop hits 0
scoreboard players remove $palm_spreader_loop gm4_gv_gen_data 1
execute if score $palm_spreader_loop gm4_gv_gen_data matches 0 run kill @s
execute if score $palm_spreader_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:generation/trees/palm_tree/palm_spreader

