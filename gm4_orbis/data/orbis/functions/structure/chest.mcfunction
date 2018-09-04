# if the chest wasn't included in the structure, place one with the default facing state
execute unless block ~ ~ ~ chest run setblock ~ ~ ~ chest

# set the loot table based on the biome
execute if score @s gm4_orbis_biome matches 0 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/desert_pyramid"}
execute if score @s gm4_orbis_biome matches 1 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/shipwrech_treasure"}
execute if score @s gm4_orbis_biome matches 2 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/desert_pyramid"}
execute if score @s gm4_orbis_biome matches 3 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/desert_pyramid"}
execute if score @s gm4_orbis_biome matches 4 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/desert_pyramid"}
