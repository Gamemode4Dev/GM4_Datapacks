
data modify storage gm4_villager_telltale:temp NBT set from entity @s
execute unless data storage gm4_villager_telltale:temp NBT.SelectedItem run data remove storage gm4_villager_telltale:temp Item
data modify storage gm4_villager_telltale:temp Item set from storage gm4_villager_telltale:temp NBT.SelectedItem.id

execute if data storage gm4_villager_telltale:temp {Item:"minecraft:crafting_table"} run 