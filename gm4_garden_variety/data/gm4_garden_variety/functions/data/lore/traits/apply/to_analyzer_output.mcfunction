# generates the tree's leaf layers
# @s = Item
# run from TODO

# copy item nbt into storage
data modify storage gm4_garden_variety:data/modify Items[{Slot:2b}] set from entity @s Item

# apply lore
function gm4_garden_variety:data/lore/traits/apply