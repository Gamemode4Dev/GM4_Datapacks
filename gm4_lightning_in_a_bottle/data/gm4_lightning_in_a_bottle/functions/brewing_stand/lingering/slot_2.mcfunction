# Brew Lingering Bottle of Lightning in Slot 2
# positioned at brewing stand
# runs from brewing_stand/check_potions

item modify block ~ ~ ~ container.2 gm4_lightning_in_a_bottle:set_zero
loot replace block ~ ~ ~ container.2 loot gm4_lightning_in_a_bottle:items/lingering_bottle_of_lightning

scoreboard players set $potion_success gm4_liab_data 1
