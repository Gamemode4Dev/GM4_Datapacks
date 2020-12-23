# generates a layer of the tree
# @s = sapling marker area_effect_cloud
# positioned ~ ~n ~ above the AEC rotated as @s
# run from gm4_fruiting_trees:generate via #gm4_fruiting_trees:layer/generate

# set target height and rotation from seed and environment
execute if score $current_layer gm4_tree_layer matches 0 run function gm4_apple_trees:tree/layer/orientate

# trunk
execute if score $current_layer gm4_tree_layer matches 0..1 run fill ~ ~ ~ ~ ~ ~ oak_log[axis=y] replace #gm4_fruiting_trees:tree_replaceable

# branches and leaves
execute if score $current_layer gm4_tree_layer matches 2 rotated as @s run function gm4_apple_trees:tree/layer/place/branch_0
execute if score $current_layer gm4_tree_layer matches 3 rotated as @s run function gm4_apple_trees:tree/layer/place/branch_1

# fruiting leaves
execute if score $current_layer gm4_tree_layer matches 4 positioned ~ ~-2 ~ run function gm4_apple_trees:tree/leaf/fruiting/select_location/extract_coordinate

# cancel generation once all branches were placed
execute if score $current_layer gm4_tree_layer matches 4 run scoreboard players set $cancel_generation gm4_tree_layer 1
