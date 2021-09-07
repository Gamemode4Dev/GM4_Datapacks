# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

# [Debug]
execute if score $debug_generation gm4_gv_gen_data matches 1 run particle happy_villager ~ ~1 ~

# [Generation] check if block is randomly picked
function gm4_garden_variety:data/generate/next_seed_value
scoreboard players operation $soil_conversion_success gm4_gv_gen_data = $current_seed gm4_gv_gen_data
scoreboard players operation $soil_conversion_success gm4_gv_gen_data %= $soil_conversion_block_chance gm4_gv_gen_data

# [Generation] replace block
execute if score $soil_conversion_success gm4_gv_gen_data matches 0..9 run function #gm4_garden_variety:mechanics/soil_conversion/convert_block
