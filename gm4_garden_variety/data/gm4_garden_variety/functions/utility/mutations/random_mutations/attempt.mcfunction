

# set random chance
scoreboard players set $random_mutation_chance_pool gm4_gv_mutations 100
scoreboard players set $random_mutation_chance_condition gm4_gv_mutations 3
execute if score $fertility gm4_gv_nbt_data matches 1 run scoreboard players add $random_mutation_chance_condition gm4_gv_mutations 1
execute if score $fertility gm4_gv_nbt_data matches 2 run scoreboard players add $random_mutation_chance_condition gm4_gv_mutations 2
execute if score $fertility gm4_gv_nbt_data matches 3 run scoreboard players add $random_mutation_chance_condition gm4_gv_mutations 3
execute if score $radiating gm4_gv_nbt_data matches 1 run scoreboard players add $random_mutation_chance_condition gm4_gv_mutations 5

# get random roll
scoreboard players set $random_pool gm4_gv_math_num 0
scoreboard players operation $random_pool gm4_gv_math_num = $random_mutation_chance_pool gm4_gv_mutations
function gm4_garden_variety:utility/get/random/roll
scoreboard players operation $random_mutation_chance_roll gm4_gv_math_num = $random_pool gm4_gv_math_num

# gain mutation
execute if score $random_mutation_chance_roll gm4_gv_mutations <= $random_mutation_chance_condition gm4_gv_mutations run function gm4_garden_variety:utility/mutations/random_mutations/gain_mutation

# merge random mutations
data modify storage gm4_garden_variety:merge/mutation input set from entity @s data.gm4_garden_variety.mutations
data modify storage gm4_garden_variety:merge/mutation output set from storage gm4_garden_variety:merge/mutation input
data modify storage gm4_garden_variety:merge/mutation merge set from entity @s data.gm4_garden_variety.random_mutations
execute store result score $merge_mutations_loop gm4_gv_mutations run data get storage gm4_garden_variety:merge/mutation merge
function gm4_garden_variety:utility/mutations/merge_mutations
data remove entity @s data.gm4_garden_variety.random_mutations
