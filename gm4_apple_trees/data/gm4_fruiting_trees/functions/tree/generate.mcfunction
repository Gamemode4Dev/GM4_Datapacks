# starts generating a tree layer by layer
# @s = sapling marker area_effect_cloud
# at @s align xyz
# run from gm4_fruiting_trees:tree/initialize

# place layer
function #gm4_fruiting_trees:tree/layer/generate

# increase layer pointer
scoreboard players add $current_layer gm4_tree_layer 1

# place next layer unless expansion forceably stopped generation or max height was reached
execute unless score $current_layer gm4_tree_layer > $max_layer gm4_tree_layer unless score $cancel_generation gm4_tree_layer matches 1.. positioned ~ ~1 ~ rotated as @s run function gm4_fruiting_trees:tree/generate
