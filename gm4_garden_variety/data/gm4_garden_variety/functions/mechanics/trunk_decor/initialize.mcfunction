# attempts to place fruit leaf on the side of the trunk
# run from gm4_garden_variety_trees:generate/king_palm/generation/trunk


# [Initialize] check if block is randomly picked
function gm4_garden_variety:utility/generate/next_seed_value
scoreboard players operation $trunk_decor_success gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $trunk_decor_success gm4_gv_tree_gen %= $trunk_decor_block_chance gm4_gv_tree_gen

# [Initialize] check direction the fruit spawns in
function gm4_garden_variety:utility/generate/next_seed_value
scoreboard players operation $trunk_decor_side gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $trunk_decor_side gm4_gv_tree_gen %= #4 gm4_gv_math_num
scoreboard players add $trunk_decor_side gm4_gv_tree_gen 1

# [Generate] summon trunk fruit marker
scoreboard players operation $trunk_decor_layer_loop gm4_gv_tree_gen = $trunk_decor_per_layer gm4_gv_tree_gen
execute if score $trunk_decor_success gm4_gv_tree_gen matches 1 run summon marker ~ ~ ~ {Tags:["gm4_trunk_decor_marker"]}
execute if score $trunk_decor_success gm4_gv_tree_gen matches 1 as @e[type=marker,tag=gm4_trunk_decor_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/trunk_decor/layer


