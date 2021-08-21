# generates the 1st layer of this apple tree
# @s = sapling marker area_effect_cloud
# positioned ~ ~n ~ above the AEC
# run from fruiting_trees:generate via #fruiting_trees:layer/generate

# rotate tree depending on seed
execute if score $bit0 gm4_tree_seed matches 1 run tp @s ~ ~ ~ 90 0
execute if score $bit1 gm4_tree_seed matches 1 rotated as @s run tp @s ~ ~ ~ ~180 0

# skip next trunk depending on seed
scoreboard players add $current_layer gm4_tree_layer 1
execute if score $max_layer gm4_tree_layer = #max_height gm4_apple_data if score $bit2 gm4_tree_seed matches 1 if score $bit3 gm4_tree_seed matches 1 run scoreboard players remove $current_layer gm4_tree_layer 1

# guidebook unlock page 2
advancement grant @a[distance=..6] only gm4_apple_trees:guidebook/page_2
