


# SET BEFORE FUNCTION
# "gm4_garden_variety:interpret mutations"

# reset
data remove storage gm4_garden_variety:interpret/mutations output

# get mutation amount
execute store result score $mutation_amount gm4_gv_nbt_data run data get storage gm4_garden_variety:interpret/mutations input

# select random mutaton
summon marker ~ ~ ~ {CustomName:'"GM4 GV Random Num"',Tags:["gm4_gv_random_num"]}
execute store result score $random_mutation gm4_gv_nbt_data run data get entity @e[type=marker,tag=gm4_gv_random_num,limit=1] UUID[3]
scoreboard players operation $random_mutation gm4_gv_nbt_data %= $mutation_amount gm4_gv_nbt_data
kill @e[type=marker,tag=gm4_gv_random_num]

# copy mutation
execute if score $random_mutation gm4_gv_nbt_data matches 0 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[0]
execute if score $random_mutation gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[1]
execute if score $random_mutation gm4_gv_nbt_data matches 2 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[2]
execute if score $random_mutation gm4_gv_nbt_data matches 3 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[3]
execute if score $random_mutation gm4_gv_nbt_data matches 4 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[4]
execute if score $random_mutation gm4_gv_nbt_data matches 5 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[5]
execute if score $random_mutation gm4_gv_nbt_data matches 6 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[6]
execute if score $random_mutation gm4_gv_nbt_data matches 7 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[7]
execute if score $random_mutation gm4_gv_nbt_data matches 8 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[8]
execute if score $random_mutation gm4_gv_nbt_data matches 9 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[9]
execute if score $random_mutation gm4_gv_nbt_data matches 10 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[10]
execute if score $random_mutation gm4_gv_nbt_data matches 11 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[11]
execute if score $random_mutation gm4_gv_nbt_data matches 12 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[12]
execute if score $random_mutation gm4_gv_nbt_data matches 13 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[13]
execute if score $random_mutation gm4_gv_nbt_data matches 14 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[13]
execute if score $random_mutation gm4_gv_nbt_data matches 15 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[13]
execute if score $random_mutation gm4_gv_nbt_data matches 16 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[13]
execute if score $random_mutation gm4_gv_nbt_data matches 17 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[13]
execute if score $random_mutation gm4_gv_nbt_data matches 18 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[13]
execute if score $random_mutation gm4_gv_nbt_data matches 19 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[13]
execute if score $random_mutation gm4_gv_nbt_data matches 20 run data modify storage gm4_garden_variety:interpret/mutations output set from storage gm4_garden_variety:interpret/mutations input[13]
