# Consume fuel if Bottle of Lightning successfully brewed
# positioned at brewing stand
# runs from brewing_stand/check_potions

# subtract 1 from score, update brewing stand
scoreboard players remove $fuel gm4_liab_data 1
execute store result storage gm4_lightning_in_a_bottle:temp/brewing_stand Fuel int 1 run scoreboard players get $fuel gm4_liab_data
data modify block ~ ~ ~ Fuel set from storage gm4_lightning_in_a_bottle:temp/brewing_stand Fuel

# grant advancement to players in range because you cannot give brewed_potion a custom effect
advancement grant @a[distance=..6] only gm4_lightning_in_a_bottle:lightning_bottle

# clean up
scoreboard players reset $fuel gm4_liab_data
data remove storage gm4_lightning_in_a_bottle:temp/brewing_stand Fuel
