# Consume fuel if Bottle of Lightning successfully brewed
# positioned at brewing stand
# runs from brewing_stand/check_potions

# subtract 1 from score, update brewing stand
# scoreboard players remove $fuel gm4_liab_data 1
# execute store result block ~ ~ ~ Fuel int 1 run scoreboard players get $fuel gm4_liab_data
# randomly use 1-3 fuel
item modify block ~ ~ ~ container.4 gm4_lightning_in_a_bottle:random_fuel_cost

# clean up
scoreboard players reset $fuel gm4_liab_data
data remove storage gm4_lightning_in_a_bottle:temp/brewing_stand Fuel
