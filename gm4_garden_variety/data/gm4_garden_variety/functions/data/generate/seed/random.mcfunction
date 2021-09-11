# generates a new seed using the tree's uuid
# @s = custom tree marker
# run from TODO

# get current time
execute store result score $current_time gm4_gv_arborist run time query gametime

# uuid
execute store result score $seed gm4_gv_tree_gen run data get entity @s UUID[2]

# time
scoreboard players operation $seed gm4_gv_tree_gen += $current_time gm4_gv_arborist

# convert seed to 16 bit
scoreboard players operation $seed gm4_gv_tree_gen %= #65536 gm4_gv_math_num

# copy seed to current seed
scoreboard players operation $current_seed gm4_gv_tree_gen = $seed gm4_gv_tree_gen

# reset seed use
scoreboard players set $seed_used gm4_gv_tree_gen 0
scoreboard players set $last_seed gm4_gv_tree_gen 0
