# if the chest wasn't included in the structure, place one with the default facing state
execute unless block ~ ~ ~ chest run setblock ~ ~ ~ chest

# set the loot table
execute store result score chest_height gm4_count run data get entity @s Pos[1]
execute if score chest_height gm4_count matches ..89 run data merge block ~ ~ ~ {LootTable:"gm4_orbis:chests/tower_70"}
execute if score chest_height gm4_count matches 90..109 run data merge block ~ ~ ~ {LootTable:"gm4_orbis:chests/tower_90"}
execute if score chest_height gm4_count matches 110..129 run data merge block ~ ~ ~ {LootTable:"gm4_orbis:chests/tower_110"}
execute if score chest_height gm4_count matches 130..149 run data merge block ~ ~ ~ {LootTable:"gm4_orbis:chests/tower_130"}
execute if score chest_height gm4_count matches 150.. run data merge block ~ ~ ~ {LootTable:"gm4_orbis:chests/tower_150"}
