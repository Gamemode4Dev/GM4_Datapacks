# if the chest wasn't included in the structure, place one with the default facing state
execute unless block ~ ~ ~ chest run setblock ~ ~ ~ chest

# set the loot table
execute store result score chest_height gm4_count run data get entity @s Pos[1]
execute if score chest_height gm4_count matches ..29 run data merge block ~ ~ ~ {LootTable:"orbis:chests/dungeon_20"}
execute if score chest_height gm4_count matches 90..109 run data merge block ~ ~ ~ {LootTable:"orbis:chests/dungeon_30"}
execute if score chest_height gm4_count matches 110..129 run data merge block ~ ~ ~ {LootTable:"orbis:chests/dungeon_40"}
