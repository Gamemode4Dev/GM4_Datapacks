


# get mutation amount + 2
execute store result score $mutation_amount gm4_gv_nbt_data run data get storage gm4_garden_variety:interpret/mutations input
scoreboard players add $mutation_amount gm4_gv_nbt_data 3

# select random mutaton
summon marker ~ ~ ~ {CustomName:'"GM4 GV Random Num"',Tags:["gm4_gv_random_num"]}
execute store result score $mutation_roll gm4_gv_nbt_data run data get entity @e[type=marker,tag=gm4_gv_random_num,limit=1] UUID[3]
scoreboard players operation $mutation_roll gm4_gv_nbt_data %= $mutation_amount gm4_gv_nbt_data
kill @e[type=marker,tag=gm4_gv_random_num]

# choose random mutation
execute if score $mutation_roll gm4_gv_nbt_data matches 3.. run function gm4_garden_variety:data/choose/random_mutation/success