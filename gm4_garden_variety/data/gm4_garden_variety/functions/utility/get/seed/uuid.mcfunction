# generates the seed based on uuid
# run from gm4_garden_variety:utility/get/seed/based_on_mode


# uuid
execute store result score uuid_0 gm4_gv_tree_gen run data get entity @s UUID[0]
execute store result score uuid_1 gm4_gv_tree_gen run data get entity @s UUID[1]
execute store result score uuid_2 gm4_gv_tree_gen run data get entity @s UUID[2]
execute store result score uuid_3 gm4_gv_tree_gen run data get entity @s UUID[3]
scoreboard players operation $seed gm4_gv_tree_gen = uuid_0 gm4_gv_tree_gen
scoreboard players operation $seed gm4_gv_tree_gen += uuid_1 gm4_gv_tree_gen
scoreboard players operation $seed gm4_gv_tree_gen += uuid_2 gm4_gv_tree_gen
scoreboard players operation $seed gm4_gv_tree_gen += uuid_3 gm4_gv_tree_gen

# convert seed to 16 bit
scoreboard players operation $seed gm4_gv_tree_gen %= #65536 gm4_gv_math_num

# copy seed to current seed
scoreboard players operation $current_seed gm4_gv_tree_gen = $seed gm4_gv_tree_gen

# reset seed use
scoreboard players set $seed_used gm4_gv_tree_gen 0
scoreboard players set $last_seed gm4_gv_tree_gen 0
