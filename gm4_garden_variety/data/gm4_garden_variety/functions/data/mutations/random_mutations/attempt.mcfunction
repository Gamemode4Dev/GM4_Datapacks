

# set random chance
scoreboard players set $mutation_chance_pool gm4_gv_mutations 100
scoreboard players set $mutation_chance_condition gm4_gv_mutations 3
execute if score $fertility gm4_gv_nbt_data matches 1 run scoreboard players add $mutation_chance_condition gm4_gv_mutations 1
execute if score $fertility gm4_gv_nbt_data matches 2 run scoreboard players add $mutation_chance_condition gm4_gv_mutations 2
execute if score $fertility gm4_gv_nbt_data matches 3 run scoreboard players add $mutation_chance_condition gm4_gv_mutations 3
execute if score $radiating gm4_gv_nbt_data matches 1 run scoreboard players add $mutation_chance_condition gm4_gv_mutations 5

# select random mutaton
summon marker ~ ~ ~ {CustomName:'"GM4 GV Random Num"',Tags:["gm4_gv_random_num"]}
execute store result score $mutation_chance_roll gm4_gv_mutations run data get entity @e[type=marker,tag=gm4_gv_random_num,limit=1] UUID[0]
scoreboard players operation $mutation_chance_roll gm4_gv_mutations %= $mutation_chance_pool gm4_gv_mutations
kill @e[type=marker,tag=gm4_gv_random_num]

# gain mutation
execute if score $mutation_chance_roll gm4_gv_mutations <= $mutation_chance_condition gm4_gv_mutations run function gm4_garden_variety:data/mutations/random_mutations/gain_mutation

# merge random mutations
data modify storage gm4_garden_variety:merge/mutation input set from entity @s data.gm4_garden_variety.mutations
data modify storage gm4_garden_variety:merge/mutation output set from storage gm4_garden_variety:merge/mutation input
data modify storage gm4_garden_variety:merge/mutation merge set from entity @s data.gm4_garden_variety.random_mutations
execute store result score $merge_mutations_loop gm4_gv_mutations run data get storage gm4_garden_variety:merge/mutation merge
function gm4_garden_variety:data/mutations/merge_mutations
data remove entity @s data.gm4_garden_variety.random_mutations
