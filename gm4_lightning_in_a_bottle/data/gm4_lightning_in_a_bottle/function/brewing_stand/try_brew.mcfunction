# Try to brew lightning potions in the brewing stand
# positioned at brewing stand
# runs from lightning/check

# Check if there is fuel left
execute store result score $fuel gm4_liab_data run data get block ~ ~ ~ Fuel
execute unless score $fuel gm4_liab_data matches 1.. run return 0

# Try to brew potions if there are regular thick potions
scoreboard players set $potion_success gm4_liab_data 0
execute store success score $potion_success gm4_liab_data run item modify block ~ ~ ~ container.0 gm4_lightning_in_a_bottle:brew_lightning
execute store success score $potion_success gm4_liab_data run item modify block ~ ~ ~ container.1 gm4_lightning_in_a_bottle:brew_lightning
execute store success score $potion_success gm4_liab_data run item modify block ~ ~ ~ container.2 gm4_lightning_in_a_bottle:brew_lightning
execute unless score $potion_success gm4_liab_data matches 1 run return 0

# Consume random fuel cost
execute store result score $fuel_cost gm4_liab_data run random value 1..3
scoreboard players operation $fuel gm4_liab_data -= $fuel_cost gm4_liab_data
execute store result block ~ ~ ~ Fuel int 1 run scoreboard players get $fuel gm4_liab_data
