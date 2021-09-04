


# SET BEFORE FUNCTION
# "gm4_garden_variety:interpret mutations"

# reset
data remove storage gm4_garden_variety:choose/mutation output

# get mutation amount
execute store result score $mutation_amount gm4_gv_mutations run data get storage gm4_garden_variety:choose/mutation input

# select random mutaton
summon marker ~ ~ ~ {CustomName:'"GM4 GV Random Num"',Tags:["gm4_gv_random_num"]}
execute store result score $random_mutation gm4_gv_mutations run data get entity @e[type=marker,tag=gm4_gv_random_num,limit=1] UUID[3]
scoreboard players operation $random_mutation gm4_gv_mutations %= $mutation_amount gm4_gv_mutations
kill @e[type=marker,tag=gm4_gv_random_num]

# copy mutation
execute if score $random_mutation gm4_gv_mutations matches 0 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[0]
execute if score $random_mutation gm4_gv_mutations matches 1 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[1]
execute if score $random_mutation gm4_gv_mutations matches 2 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[2]
execute if score $random_mutation gm4_gv_mutations matches 3 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[3]
execute if score $random_mutation gm4_gv_mutations matches 4 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[4]
execute if score $random_mutation gm4_gv_mutations matches 5 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[5]
execute if score $random_mutation gm4_gv_mutations matches 6 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[6]
execute if score $random_mutation gm4_gv_mutations matches 7 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[7]
execute if score $random_mutation gm4_gv_mutations matches 8 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[8]
execute if score $random_mutation gm4_gv_mutations matches 9 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[9]
execute if score $random_mutation gm4_gv_mutations matches 10 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[10]
execute if score $random_mutation gm4_gv_mutations matches 11 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[11]
execute if score $random_mutation gm4_gv_mutations matches 12 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[12]
execute if score $random_mutation gm4_gv_mutations matches 13 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[13]
execute if score $random_mutation gm4_gv_mutations matches 14 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[13]
execute if score $random_mutation gm4_gv_mutations matches 15 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[13]
execute if score $random_mutation gm4_gv_mutations matches 16 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[13]
execute if score $random_mutation gm4_gv_mutations matches 17 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[13]
execute if score $random_mutation gm4_gv_mutations matches 18 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[13]
execute if score $random_mutation gm4_gv_mutations matches 19 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[13]
execute if score $random_mutation gm4_gv_mutations matches 20 run data modify storage gm4_garden_variety:choose/mutation output set from storage gm4_garden_variety:choose/mutation input[13]
