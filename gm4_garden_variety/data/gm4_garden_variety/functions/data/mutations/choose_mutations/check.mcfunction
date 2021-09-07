


# get mutation amount + 2
execute store result score $chosen_random_mutation gm4_gv_mutations run data get storage gm4_garden_variety:choose/mutation input
scoreboard players add $chosen_random_mutation gm4_gv_mutations 3

# select random mutaton
summon marker ~ ~ ~ {CustomName:'"GM4 GV Random Num"',Tags:["gm4_gv_random_num"]}
execute store result score $chosen_mutation_roll gm4_gv_mutations run data get entity @e[type=marker,tag=gm4_gv_random_num,limit=1] UUID[3]
scoreboard players operation $chosen_mutation_roll gm4_gv_mutations %= $chosen_random_mutation gm4_gv_mutations
kill @e[type=marker,tag=gm4_gv_random_num]

# choose random mutation
execute if score $chosen_mutation_roll gm4_gv_mutations matches 3.. run function gm4_garden_variety:data/mutations/choose_mutations/success