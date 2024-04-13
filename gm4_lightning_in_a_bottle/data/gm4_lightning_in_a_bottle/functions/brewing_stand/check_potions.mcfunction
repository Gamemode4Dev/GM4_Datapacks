# Checks if there are regular Thick Potions in the Brewing Stand
# positioned at brewing stand
# runs from brewing_stand/check_fuel

# attempt to "brew" Bottles of Lightning
scoreboard players set $potion_success gm4_liab_data 0

execute if items block ~ ~ ~ container.0 minecraft:lingering_potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.0 loot gm4_lightning_in_a_bottle:items/lingering_bottle_of_lightning
execute if items block ~ ~ ~ container.1 minecraft:lingering_potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.1 loot gm4_lightning_in_a_bottle:items/lingering_bottle_of_lightning
execute if items block ~ ~ ~ container.2 minecraft:lingering_potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.2 loot gm4_lightning_in_a_bottle:items/lingering_bottle_of_lightning

execute if items block ~ ~ ~ container.0 minecraft:splash_potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.0 loot gm4_lightning_in_a_bottle:items/splash_bottle_of_lightning
execute if items block ~ ~ ~ container.1 minecraft:splash_potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.1 loot gm4_lightning_in_a_bottle:items/splash_bottle_of_lightning
execute if items block ~ ~ ~ container.2 minecraft:splash_potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.2 loot gm4_lightning_in_a_bottle:items/splash_bottle_of_lightning

execute if items block ~ ~ ~ container.0 minecraft:potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.0 loot gm4_lightning_in_a_bottle:items/bottle_of_lightning
execute if items block ~ ~ ~ container.1 minecraft:potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.1 loot gm4_lightning_in_a_bottle:items/bottle_of_lightning
execute if items block ~ ~ ~ container.2 minecraft:potion[potion_contents="minecraft:thick"] store success score $potion_success gm4_liab_data run loot replace block ~ ~ ~ container.2 loot gm4_lightning_in_a_bottle:items/bottle_of_lightning

# consume fuel, if succcess
execute if score $potion_success gm4_liab_data matches 1 run function gm4_lightning_in_a_bottle:brewing_stand/consume_fuel
scoreboard players reset $potion_success gm4_liab_data
