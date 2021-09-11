


# get mutation amount + 1
scoreboard players set $chosen_random_mutation gm4_gv_mutations 0
execute store result score $chosen_random_mutation gm4_gv_mutations run data get storage gm4_garden_variety:choose/mutation input
scoreboard players add $chosen_random_mutation gm4_gv_mutations 1

# select random mutaton
summon marker ~ ~ ~ {CustomName:'"GM4 GV Random Num"',Tags:["gm4_gv_random_num"]}
execute store result score $chosen_mutation_roll gm4_gv_mutations run data get entity @e[type=marker,tag=gm4_gv_random_num,limit=1] UUID[3]
scoreboard players operation $chosen_mutation_roll gm4_gv_mutations %= $chosen_random_mutation gm4_gv_mutations
kill @e[type=marker,tag=gm4_gv_random_num]

# choose random mutation
execute if score $chosen_mutation_roll gm4_gv_mutations matches 2.. run function gm4_garden_variety:utility/mutations/choose_mutations/success