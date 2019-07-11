#@s = alchemical crafters with valid recipe format inside
#run from recipe_validity_check

#check and store charge of transmutation stone
execute store result score @s gm4_ee_charge run data get block ~ ~ ~ Items[0].tag.gm4_transmutation_charge

#recipes
execute if score @s gm4_ee_charge matches 1.. run function equivalent_exchange:recipes/colored
execute if score @s gm4_ee_charge matches 1.. run function equivalent_exchange:recipes/dye
execute if score @s gm4_ee_charge matches 2.. run function equivalent_exchange:recipes/food
execute if score @s gm4_ee_charge matches 101.. run function equivalent_exchange:recipes/ore
execute if score @s gm4_ee_charge matches 1.. run function equivalent_exchange:recipes/plant
execute if score @s gm4_ee_charge matches 1.. run function equivalent_exchange:recipes/stone
execute if score @s gm4_ee_charge matches 5.. run function equivalent_exchange:recipes/uncraft
execute if score @s gm4_ee_charge matches 1.. run function equivalent_exchange:recipes/wood
