# if the chest wasn't included in the structure, place one with the default facing state
execute unless block ~ ~ ~ chest run setblock ~ ~ ~ chest

# set the loot table
data merge block ~ ~ ~ {LootTable:"orbis:chests/tower"}
