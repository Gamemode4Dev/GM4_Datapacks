# initializes fruit decor generator
# @s = @e[type=marker,tag=gm4_tree_trunk_marker]
# at @s
# run from gm4_garden_variety_trees:generate/TREE_TYPE/integration/garden_variety/mechanics/tree_generation/trunk_layer


# check if block is randomly picked
function gm4_garden_variety:utility/get/seed/next_value
scoreboard players operation $trunk_decor_success gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $trunk_decor_success gm4_gv_tree_gen %= $trunk_decor_block_chance gm4_gv_tree_gen

# check direction the fruit spawns in
function gm4_garden_variety:utility/get/seed/next_value
scoreboard players operation $trunk_decor_side gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $trunk_decor_side gm4_gv_tree_gen %= #4 gm4_gv_math_num
scoreboard players add $trunk_decor_side gm4_gv_tree_gen 1

# summon trunk fruit marker
scoreboard players operation $trunk_decor_layer_loop gm4_gv_tree_gen = $trunk_decor_per_layer gm4_gv_tree_gen
execute if score $trunk_decor_success gm4_gv_tree_gen matches 1 run summon marker ~ ~ ~ {Tags:["gm4_trunk_decor_marker"]}
execute if score $trunk_decor_success gm4_gv_tree_gen matches 1 as @e[type=marker,tag=gm4_trunk_decor_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/trunk_decor/layer


