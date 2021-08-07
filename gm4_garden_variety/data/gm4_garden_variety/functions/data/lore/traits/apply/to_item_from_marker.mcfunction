# generates the tree's leaf layers
# @s = Item
# run from TODO

# copy item nbt into storage
data modify storage gm4_garden_variety:data/modify Item set from entity @s Item

# apply lore
function gm4_garden_variety:data/lore/traits/apply

# copy storage into item nbt
data modify entity @s Item set from storage gm4_garden_variety:data/modify Item
