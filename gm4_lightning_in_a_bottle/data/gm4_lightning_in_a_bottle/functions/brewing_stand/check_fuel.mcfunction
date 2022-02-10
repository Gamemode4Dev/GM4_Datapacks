# Checks if there is fuel in the Brewing Stand
# positioned at brewing stand
# runs from lightning/check

execute store result score $fuel gm4_liab_data run data get block ~ ~ ~ Fuel
execute if score $fuel gm4_liab_data matches 1.. run function gm4_lightning_in_a_bottle:brewing_stand/check_potions
