#@s = alchemical crafters with valid recipe format inside
#run from recipe_validity_check

#check and store charge of transmutation stone
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}}]} store result score @s gm4_charge_level run data get block ~ ~ ~ Items[0].tag.gm4_transmutation_charge

#recipes
function equivalent_exchange:recipes/recharge
function equivalent_exchange:recipes/ore
function equivalent_exchange:recipes/reverse_ore
function equivalent_exchange:recipes/dye
function equivalent_exchange:recipes/plant
function equivalent_exchange:recipes/wood
function equivalent_exchange:recipes/colored
function equivalent_exchange:recipes/stone
function equivalent_exchange:recipes/food
function equivalent_exchange:recipes/storage_blocks