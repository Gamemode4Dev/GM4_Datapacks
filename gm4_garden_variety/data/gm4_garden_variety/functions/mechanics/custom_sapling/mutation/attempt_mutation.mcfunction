# attempts to mutate a fully grown sapling
# run from gm4_garden_variety:mechanics/custom_sapling/generate_tree


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
scoreboard players operation $random_mutation_chance_roll gm4_gv_mutations = $random_roll gm4_gv_math_num

# generate mutation
execute unless score $always_mutate gm4_gv_nbt_data matches 1 if score $random_mutation_chance_roll gm4_gv_mutations <= $random_mutation_chance_condition gm4_gv_mutations run function gm4_garden_variety:mechanics/custom_sapling/apply_random_mutation
execute if score $always_mutate gm4_gv_nbt_data matches 1 run function gm4_garden_variety:mechanics/custom_sapling/mutation/apply_random_mutation
