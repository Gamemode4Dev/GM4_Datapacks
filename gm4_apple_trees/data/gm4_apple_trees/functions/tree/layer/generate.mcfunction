# generates a layer of the tree
# @s = sapling marker area_effect_cloud
# positioned ~ ~n ~ above the AEC rotated as @s
# run from gm4_fruiting_trees:generate via #gm4_fruiting_trees:layer/generate

# set target height and rotation from seed and environment
execute if score $current_layer gm4_tree_layer matches 0 run function gm4_apple_trees:tree/layer/orientate

# trunk
execute if score $current_layer gm4_tree_layer matches 0..1 run fill ~ ~ ~ ~ ~ ~ oak_log[axis=y] replace #gm4_apple_trees:tree_replaceable

# branches
execute if score $current_layer gm4_tree_layer matches 2 rotated as @s run function gm4_apple_trees:tree/layer/place/branch_0
execute if score $current_layer gm4_tree_layer matches 3 rotated as @s run function gm4_apple_trees:tree/layer/place/branch_1

# cancel generation once all branches were placed. Leave placing is done in brach_1x code
execute if score $current_layer gm4_tree_layer matches 3 run scoreboard players set $cancel_generation gm4_tree_layer 1
