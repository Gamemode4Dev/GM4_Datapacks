# attempts to place fruit leaf on the side of the trunk
# run from gm4_natural_trees:generate/king_palm/generation/trunk



# check if block is randomly picked
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation trunk_fruit_success gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation trunk_fruit_success gm4_gv_gen_data %= trunk_fruit_block_chance gm4_gv_gen_data

# check direction the fruit spawns in
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation trunk_fruit_side gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation trunk_fruit_side gm4_gv_gen_data %= #4 gm4_gv_math_num
scoreboard players add trunk_fruit_side gm4_gv_gen_data 1

# summon trunk fruit marker
scoreboard players operation trunk_fruit_layer_loop gm4_gv_gen_data = trunk_fruit_per_layer gm4_gv_gen_data
execute if score trunk_fruit_success gm4_gv_gen_data matches 1 run summon marker ~ ~ ~ {Tags:["gm4_trunk_fruit_marker"]}
execute as @e[type=marker,tag=gm4_trunk_fruit_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:generation/trunk_fruit/layer


