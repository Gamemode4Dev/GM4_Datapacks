# Consume fuel if Bottle of Lightning successfully brewed
# @s = lightning bolt
# positioned at brewing stand
# runs from brewing_stand/check_potions

# get random value from 0-2 based on lightning bolt's UUID[3]
execute store result score $fuel_cost gm4_liab_data run data get entity @s UUID[3]
scoreboard players operation $fuel_cost gm4_liab_data %= #3 gm4_liab_data

# move bounds from 0-2 to 1-3
scoreboard players add $fuel_cost gm4_liab_data 1

# subtract fuel cost from Fuel and set to block's Fuel
scoreboard players operation $fuel gm4_liab_data -= $fuel_cost gm4_liab_data
execute store result block ~ ~ ~ Fuel int 1 run scoreboard players get $fuel gm4_liab_data


# clean up
scoreboard players reset $fuel gm4_liab_data
data remove storage gm4_lightning_in_a_bottle:temp/brewing_stand Fuel
