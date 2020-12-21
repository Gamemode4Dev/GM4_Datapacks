# generates the 1st layer of this apple tree
# @s = sapling marker area_effect_cloud
# at @s align xyz
# run from fruiting_trees:generate via #fruiting_trees:layer/generate

# skip next trunk depending on seed
scoreboard players add $current_layer gm4_tree_layer 1
execute if score $max_layer gm4_tree_layer = #max_height gm4_apple_data if score bit2 gm4_tree_seed matches 0 if score bit3 gm4_tree_seed matches 0 run scoreboard players remove $current_layer gm4_tree_layer 1
