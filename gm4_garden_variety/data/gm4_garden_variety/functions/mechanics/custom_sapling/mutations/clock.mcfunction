

# set random chance
scoreboard players set $mutation_chance_pool gm4_gv_mutations 100
execute if score @s gm4_gv_mutations matches 1.. run scoreboard players add $mutation_chance_pool gm4_gv_mutations 100
execute if score @s gm4_gv_mutations matches 2.. run scoreboard players add $mutation_chance_pool gm4_gv_mutations 100

# select random mutaton
summon marker ~ ~ ~ {CustomName:'"GM4 GV Random Num"',Tags:["gm4_gv_random_num"]}
execute store result score $mutation_chance_roll gm4_gv_mutations run data get entity @e[type=marker,tag=gm4_gv_random_num,limit=1] UUID[0]
scoreboard players operation $mutation_chance_roll gm4_gv_mutations %= $mutation_chance_pool gm4_gv_mutations
kill @e[type=marker,tag=gm4_gv_random_num]

# gain mutation
execute if score $mutation_chance_roll gm4_gv_mutations matches ..25 run function gm4_garden_variety:mechanics/custom_sapling/mutations/gain_mutation

