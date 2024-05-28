# Checks if there are regular Thick Potions in the Brewing Stand
# positioned at brewing stand
# runs from brewing_stand/check_fuel

# attempt to "brew" Bottles of Lightning
scoreboard players set $potion_success gm4_liab_data 0

execute store success score $potion_success gm4_liab_data run item modify block ~ ~ ~ container.0 gm4_lightning_in_a_bottle:brew_lightning
execute store success score $potion_success gm4_liab_data run item modify block ~ ~ ~ container.1 gm4_lightning_in_a_bottle:brew_lightning
execute store success score $potion_success gm4_liab_data run item modify block ~ ~ ~ container.2 gm4_lightning_in_a_bottle:brew_lightning

# consume fuel, if succcess
execute if score $potion_success gm4_liab_data matches 1 run function gm4_lightning_in_a_bottle:brewing_stand/consume_fuel
scoreboard players reset $potion_success gm4_liab_data
