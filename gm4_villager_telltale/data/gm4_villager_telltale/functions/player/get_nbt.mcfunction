
# get nbt
data modify storage gm4_villager_telltale:temp/player NBT set from entity @s

# get selected item
execute unless data storage gm4_villager_telltale:temp/player NBT.SelectedItem run data remove storage gm4_villager_telltale:temp/player Item
data modify storage gm4_villager_telltale:temp/player Item set from storage gm4_villager_telltale:temp/player NBT.SelectedItem.id
