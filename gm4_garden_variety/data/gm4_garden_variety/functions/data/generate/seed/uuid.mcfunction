# generates a new seed using the tree's uuid
# @s = custom tree marker
# run from TODO

# uuid
execute store result score uuid_0 gm4_gv_gen_data run data get entity @s UUID[0]
execute store result score uuid_1 gm4_gv_gen_data run data get entity @s UUID[1]
execute store result score uuid_2 gm4_gv_gen_data run data get entity @s UUID[2]
execute store result score uuid_3 gm4_gv_gen_data run data get entity @s UUID[3]
scoreboard players operation seed gm4_gv_gen_data = uuid_0 gm4_gv_gen_data
scoreboard players operation seed gm4_gv_gen_data += uuid_1 gm4_gv_gen_data
scoreboard players operation seed gm4_gv_gen_data += uuid_2 gm4_gv_gen_data
scoreboard players operation seed gm4_gv_gen_data += uuid_3 gm4_gv_gen_data

# convert seed to 16 bit
scoreboard players operation seed gm4_gv_gen_data %= #65536 gm4_gv_math_num

# copy seed to current seed
scoreboard players operation $current_seed gm4_gv_gen_data = seed gm4_gv_gen_data

# reset seed use
scoreboard players set seed_used gm4_gv_gen_data 0
