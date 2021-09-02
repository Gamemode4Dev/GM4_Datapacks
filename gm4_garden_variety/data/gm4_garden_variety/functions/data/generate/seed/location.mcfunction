# generates a new seed using the tree's position
# @s = custom tree marker
# run from #gm4_garden_variety:data/generate/position_seed

# coordinate
scoreboard players set $seed gm4_gv_gen_data 1
data modify storage gm4_garden_variety:temp/seed Pos set from entity @s Pos
execute store result score seed_pos_x gm4_gv_gen_data run data get storage gm4_garden_variety:temp/seed Pos[0]
scoreboard players operation $seed gm4_gv_gen_data = seed_pos_x gm4_gv_gen_data
execute store result score seed_pos_y gm4_gv_gen_data run data get storage gm4_garden_variety:temp/seed Pos[1]
scoreboard players operation $seed gm4_gv_gen_data *= seed_pos_y gm4_gv_gen_data
execute store result score seed_pos_z gm4_gv_gen_data run data get storage gm4_garden_variety:temp/seed Pos[2]
scoreboard players operation $seed gm4_gv_gen_data += seed_pos_z gm4_gv_gen_data

# world seed
scoreboard players operation $seed gm4_gv_gen_data += $world_seed gm4_gv_gen_data

# convert seed to 16 bit
scoreboard players operation $seed gm4_gv_gen_data %= #65536 gm4_gv_math_num

# copy seed to current seed
scoreboard players operation $current_seed gm4_gv_gen_data = $seed gm4_gv_gen_data

# reset seed use
scoreboard players set $seed_used gm4_gv_gen_data 0
scoreboard players set $last_seed gm4_gv_gen_data 0
