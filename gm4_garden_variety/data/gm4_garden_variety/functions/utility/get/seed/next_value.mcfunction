# generates the next current seed using the tree's seed
# @s = any equation that needs another seed value
# run from #gm4_garden_variety:


# count seed use
scoreboard players add $seed_used gm4_gv_tree_gen 1
scoreboard players add $seed_used_eo4 gm4_gv_tree_gen 1
execute if score $seed_used_eo4 gm4_gv_tree_gen matches 4 run scoreboard players set $seed_used_eo4 gm4_gv_tree_gen 0

# generate seed (part 1)
scoreboard players operation $current_seed gm4_gv_tree_gen = $seed gm4_gv_tree_gen
scoreboard players operation $current_seed gm4_gv_tree_gen += $last_seed gm4_gv_tree_gen
scoreboard players operation $current_seed gm4_gv_tree_gen += $seed_used gm4_gv_tree_gen
scoreboard players operation $current_seed gm4_gv_tree_gen += $seed gm4_gv_tree_gen

# generate seed (part 2)
execute if score $seed_used_eo4 gm4_gv_tree_gen matches 1 run scoreboard players operation $current_seed gm4_gv_tree_gen += $seed_used gm4_gv_tree_gen
execute if score $seed_used_eo4 gm4_gv_tree_gen matches 2 run scoreboard players operation $current_seed gm4_gv_tree_gen += $seed gm4_gv_tree_gen
execute if score $seed_used_eo4 gm4_gv_tree_gen matches 3 run scoreboard players operation $current_seed gm4_gv_tree_gen += $last_seed gm4_gv_tree_gen

# remember current seed
scoreboard players operation $last_seed gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
