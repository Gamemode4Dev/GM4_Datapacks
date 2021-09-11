# generates a new seed using the tree's position
# @s = custom tree marker
# run from #gm4_garden_variety:utility/generate/position_seed

# coordinate
scoreboard players set $seed gm4_gv_tree_gen 1
data modify storage gm4_garden_variety:temp/seed Pos set from entity @s Pos
execute store result score seed_pos_x gm4_gv_tree_gen run data get storage gm4_garden_variety:temp/seed Pos[0]
scoreboard players operation $seed gm4_gv_tree_gen = seed_pos_x gm4_gv_tree_gen
execute store result score seed_pos_y gm4_gv_tree_gen run data get storage gm4_garden_variety:temp/seed Pos[1]
scoreboard players operation $seed gm4_gv_tree_gen *= seed_pos_y gm4_gv_tree_gen
execute store result score seed_pos_z gm4_gv_tree_gen run data get storage gm4_garden_variety:temp/seed Pos[2]
scoreboard players operation $seed gm4_gv_tree_gen += seed_pos_z gm4_gv_tree_gen

# world seed
scoreboard players operation $seed gm4_gv_tree_gen += $world_seed gm4_gv_tree_gen

# convert seed to 16 bit
scoreboard players operation $seed gm4_gv_tree_gen %= #65536 gm4_gv_math_num

# copy seed to current seed
scoreboard players operation $current_seed gm4_gv_tree_gen = $seed gm4_gv_tree_gen

# reset seed use
scoreboard players set $seed_used gm4_gv_tree_gen 0
scoreboard players set $last_seed gm4_gv_tree_gen 0
