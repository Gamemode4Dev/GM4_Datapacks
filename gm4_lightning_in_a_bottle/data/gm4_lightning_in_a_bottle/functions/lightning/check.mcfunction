# Creates and empowers certain mobs and creates Bottles of Lightning
# @s = lightning bolt
# at @s
# run from lightning/locate

# tag processed lightning
tag @s add gm4_liab_processed

# create Bottles of Lightning from Thick Potions in Brewing Stands under (or above) Lightning Rods
execute if block ~ ~-1 ~ lightning_rod[facing=up] if block ~ ~-2 ~ brewing_stand positioned ~ ~-2 ~ run function gm4_lightning_in_a_bottle:brewing_stand/check_fuel
execute if block ~ ~-1 ~ lightning_rod[facing=down] if block ~ ~ ~ brewing_stand run function gm4_lightning_in_a_bottle:brewing_stand/check_fuel

# Lightning-based mob transformation
# Evokers -> Illusioners
execute align xyz positioned ~-3 ~-2 ~-3 as @e[type=evoker,dx=6,dy=11,dz=6] at @s run function gm4_lightning_in_a_bottle:entity/illusioner
# Pillagers -> Evokers
execute align xyz positioned ~-3 ~-2 ~-3 as @e[type=pillager,dx=6,dy=11,dz=6] at @s run function gm4_lightning_in_a_bottle:entity/evoker
# Guardians -> Elder Guardians
execute align xyz positioned ~-3 ~-2 ~-3 as @e[type=guardian,dx=6,dy=11,dz=6] at @s run function gm4_lightning_in_a_bottle:entity/elder_guardian

# Creeper Spawners struck by the lightning will become Charged Creepers Spawners
execute if block ~ ~-1 ~ spawner{SpawnData:{id:"minecraft:creeper"}} run data merge block ~ ~-1 ~ {MaxSpawnDelay:801s,SpawnData:{id:"minecraft:creeper",powered:1b,},SpawnPotentials:[{Entity:{id:"minecraft:creeper",powered:1b,DeathLootTable:"gm4_lightning_in_a_bottle:entities/charged_creeper"},Weight:1}]}

# Lightning-based block -> entity transformation
# inside strike location
execute if block ~ ~ ~ purpur_block run function gm4_lightning_in_a_bottle:entity/shulker
execute unless score $found_block gm4_liab_data matches 1.. if block ~ ~ ~ prismarine_bricks run function gm4_lightning_in_a_bottle:entity/guardian
# below strike location
execute unless score $found_block gm4_liab_data matches 1.. positioned ~ ~-1 ~ if block ~ ~ ~ purpur_block run function gm4_lightning_in_a_bottle:entity/shulker
execute unless score $found_block gm4_liab_data matches 1.. positioned ~ ~-1 ~ if block ~ ~ ~ prismarine_bricks run function gm4_lightning_in_a_bottle:entity/guardian

# other lightning-based expansions can happen after
function #gm4_lightning_in_a_bottle:lightning_strike

# reset fake players
scoreboard players reset $found_block gm4_liab_data
