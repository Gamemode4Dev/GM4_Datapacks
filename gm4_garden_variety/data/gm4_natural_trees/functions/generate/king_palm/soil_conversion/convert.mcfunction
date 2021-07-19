# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

# reset
scoreboard players set soil_conversion_replace gm4_gv_gen_data 0

# replace block
execute if score soil_conversion_replace gm4_gv_gen_data matches 0 store success score soil_conversion_replace gm4_gv_gen_data run fill ~ ~ ~ ~ ~-2 ~ sand replace grass_block
execute if score soil_conversion_replace gm4_gv_gen_data matches 0 store success score soil_conversion_replace gm4_gv_gen_data run fill ~ ~ ~ ~ ~-2 ~ grass_block replace sand

# keep track
execute if score soil_conversion_replace gm4_gv_gen_data matches 1 run scoreboard players remove soil_conversion_max gm4_gv_gen_data 1
