# generates the seed based on uuid and time
# run from gm4_garden_variety:utility/get/seed/based_on_mode


# get current time
execute store result score $current_time gm4_gv_arborist run time query gametime

# uuid
execute store result score $seed gm4_gv_tree_gen run data get entity @s UUID[2]

# time
scoreboard players operation $seed gm4_gv_tree_gen += $current_time gm4_gv_arborist

# copy seed to current seed
scoreboard players operation $current_seed gm4_gv_tree_gen = $seed gm4_gv_tree_gen

# reset seed use
scoreboard players set $seed_used gm4_gv_tree_gen 0
scoreboard players set $last_seed gm4_gv_tree_gen 0
