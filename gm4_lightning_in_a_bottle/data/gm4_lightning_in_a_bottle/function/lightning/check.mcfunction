# Creates and empowers certain mobs and creates Bottles of Lightning
# @s = lightning bolt
# at @s
# run from lightning/locate

# tag processed lightning
tag @s add gm4_liab_processed

# create Bottles of Lightning from Thick Potions in Brewing Stands under (or above) Lightning Rods
execute if block ~ ~-.01 ~ lightning_rod[facing=up] if block ~ ~-1.01 ~ brewing_stand positioned ~ ~-1.01 ~ run function gm4_lightning_in_a_bottle:brewing_stand/check_fuel
execute if block ~ ~-.01 ~ lightning_rod[facing=down] if block ~ ~.99 ~ brewing_stand positioned ~ ~.99 ~ run function gm4_lightning_in_a_bottle:brewing_stand/check_fuel

# Lightning-based mob transformation
# Evokers -> Illusioners
execute align xyz positioned ~-3 ~-2 ~-3 as @e[type=evoker,tag=!smithed.entity,dx=6,dy=11,dz=6] at @s run function gm4_lightning_in_a_bottle:entity/illusioner
# Pillagers -> Evokers
execute align xyz positioned ~-3 ~-2 ~-3 as @e[type=pillager,tag=!smithed.entity,dx=6,dy=11,dz=6] at @s run function gm4_lightning_in_a_bottle:entity/evoker

# Creeper Spawners struck by the lightning will become Charged Creepers Spawners
execute align xyz positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ spawner{SpawnData:{entity:{id:"minecraft:creeper"}}} unless entity @e[tag=!smithed.block,distance=..0.5] run data merge block ~ ~ ~ {MaxSpawnDelay:801s,SpawnData:{entity:{id:"minecraft:creeper",powered:1b}},SpawnPotentials:[{data:{entity:{id:"minecraft:creeper",powered:1b,DeathLootTable:"gm4_lightning_in_a_bottle:entities/charged_creeper"}},weight:1}]}

# Lightning-based block -> entity transformation
# inside strike location
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ purpur_block unless entity @e[tag=smithed.block,distance=..0.5] run function gm4_lightning_in_a_bottle:entity/shulker
execute unless score $found_block gm4_liab_data matches 1.. align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ prismarine_bricks unless entity @e[tag=smithed.block,distance=..0.5] run function gm4_lightning_in_a_bottle:entity/guardian
# below strike location
execute unless score $found_block gm4_liab_data matches 1.. align xyz positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ purpur_block unless entity @e[tag=smithed.block,distance=..0.5] run function gm4_lightning_in_a_bottle:entity/shulker
execute unless score $found_block gm4_liab_data matches 1.. align xyz positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ prismarine_bricks unless entity @e[tag=smithed.block,distance=..0.5] run function gm4_lightning_in_a_bottle:entity/guardian

# other lightning-based expansions can happen after
function #gm4_lightning_in_a_bottle:lightning_strike

# reset fake players
scoreboard players reset $found_block gm4_liab_data
