# generates the next current seed using the tree's seed
# @s = any equation that needs another seed value
# run from #gm4_garden_variety:

# reset seed use
scoreboard players add seed_used gm4_gv_gen_data 1

# cycle to next current seed
scoreboard players operation $current_seed gm4_gv_gen_data = seed gm4_gv_gen_data
scoreboard players operation $current_seed gm4_gv_gen_data *= seed_used gm4_gv_gen_data
scoreboard players operation $current_seed gm4_gv_gen_data += seed gm4_gv_gen_data
scoreboard players operation $current_seed gm4_gv_gen_data += seed_used gm4_gv_gen_data


