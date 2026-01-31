# Consume fuel if Bottle of Lightning successfully brewed
# @s = lightning bolt
# positioned at brewing stand
# runs from brewing_stand/check_potions

# get random fuel cost
execute store result score $fuel_cost gm4_liab_data run random value 1..3

# subtract fuel cost from Fuel and set to block's Fuel
scoreboard players operation $fuel gm4_liab_data -= $fuel_cost gm4_liab_data
execute store result block ~ ~ ~ Fuel int 1 run scoreboard players get $fuel gm4_liab_data
