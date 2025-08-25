#@s = liquid tank to be initialized to random potion
#run from potion_liquids:util/witch

execute store result score $random_witch_init gm4_lt_util run random value 0..3

execute if score $random_witch_init gm4_lt_util matches 0 run function gm4_potion_liquids:liquid_init/regeneration
execute if score $random_witch_init gm4_lt_util matches 1 run function gm4_potion_liquids:liquid_init/swiftness
execute if score $random_witch_init gm4_lt_util matches 2 run function gm4_potion_liquids:liquid_init/fire_resistance
execute if score $random_witch_init gm4_lt_util matches 3 run function gm4_potion_liquids:liquid_init/harming
