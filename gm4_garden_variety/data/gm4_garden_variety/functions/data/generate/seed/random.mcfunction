# generates a new seed using the tree's uuid
# @s = custom tree marker
# run from TODO

# get current time
execute store result score current_time gm4_gv_arborist run time query daytime

# uuid
execute store result score seed gm4_gv_gen_data run data get entity @s UUID[2]

# time
scoreboard players operation seed gm4_gv_gen_data += current_time gm4_gv_arborist

# convert seed to 16 bit
scoreboard players operation seed gm4_gv_gen_data %= #65536 gm4_gv_math_num

# copy seed to current seed
scoreboard players operation $current_seed gm4_gv_gen_data = seed gm4_gv_gen_data

# reset seed use
scoreboard players set seed_used gm4_gv_gen_data 0
