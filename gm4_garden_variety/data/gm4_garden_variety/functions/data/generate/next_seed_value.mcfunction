# generates the next current seed using the tree's seed
# @s = any equation that needs another seed value
# run from #gm4_garden_variety:

# count seed use
scoreboard players add $seed_used gm4_gv_gen_data 1
scoreboard players add $seed_used_eo2 gm4_gv_gen_data 1
execute if score $seed_used_eo4 gm4_gv_gen_data matches 4 run scoreboard players set $seed_used_eo4 gm4_gv_gen_data 0

# generate seed (part 1)
scoreboard players operation $current_seed gm4_gv_gen_data = $seed gm4_gv_gen_data
scoreboard players operation $current_seed gm4_gv_gen_data += $last_seed gm4_gv_gen_data
scoreboard players operation $current_seed gm4_gv_gen_data += $seed_used gm4_gv_gen_data

# generate seed (part 2)
execute if score $seed_used_eo4 gm4_gv_gen_data matches 1 run scoreboard players operation $current_seed gm4_gv_gen_data += $seed gm4_gv_gen_data
execute if score $seed_used_eo4 gm4_gv_gen_data matches 2 run scoreboard players operation $current_seed gm4_gv_gen_data += $last_seed gm4_gv_gen_data
execute if score $seed_used_eo4 gm4_gv_gen_data matches 3 run scoreboard players operation $current_seed gm4_gv_gen_data += $seed_used gm4_gv_gen_data

# remember current seed
scoreboard players operation $last_seed gm4_gv_gen_data = $current_seed gm4_gv_gen_data