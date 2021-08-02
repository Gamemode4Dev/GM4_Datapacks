# if the chest wasn't included in the structure, place one with the default facing state
execute unless block ~ ~ ~ chest run setblock ~ ~ ~ chest

# set the loot table
execute store result score chest_height gm4_count run data get entity @s Pos[1]
execute if score chest_height gm4_count matches ..29 run data merge block ~ ~ ~ {LootTable:"gm4_orbis:chests/dungeon_20"}
execute if score chest_height gm4_count matches 30..39 run data merge block ~ ~ ~ {LootTable:"gm4_orbis:chests/dungeon_30"}
execute if score chest_height gm4_count matches 40.. run data merge block ~ ~ ~ {LootTable:"gm4_orbis:chests/dungeon_40"}

# set the loot table seed
data modify storage gm4_orbis:temp Pos set from entity @s Pos
execute store result score $x gm4_orbis_config run data get storage gm4_orbis:temp Pos[0]
execute store result score $y gm4_orbis_config run data get storage gm4_orbis:temp Pos[1]
execute store result score $z gm4_orbis_config run data get storage gm4_orbis:temp Pos[2]
data remove storage gm4_orbis:temp Pos

scoreboard players operation $loot_table_seed gm4_orbis_config = #world_seed gm4_orbis_config
scoreboard players operation $loot_table_seed gm4_orbis_config *= $x gm4_orbis_config
scoreboard players operation $loot_table_seed gm4_orbis_config *= $y gm4_orbis_config
scoreboard players operation $loot_table_seed gm4_orbis_config *= $z gm4_orbis_config

execute store result block ~ ~ ~ LootTableSeed long 1 run scoreboard players get $loot_table_seed gm4_orbis_config
