execute unless block ~ ~ ~ chest run setblock ~ ~ ~ chest

execute if score @s orbis_biome matches 0 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/abandoned_mineshaft"}
execute if score @s orbis_biome matches 1 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/shopwrech_treasure"}
execute if score @s orbis_biome matches 2 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/desert_pyramid"}
execute if score @s orbis_biome matches 3 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/abandoned_mineshaft"}
execute if score @s orbis_biome matches 4 run data merge block ~ ~ ~ {LootTable:"minecraft:chests/desert_pyramid"}
