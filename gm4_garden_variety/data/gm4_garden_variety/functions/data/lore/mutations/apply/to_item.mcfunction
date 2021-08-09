# generates the tree's leaf layers
# @s = Item
# run from TODO

# convert nbt to scores
data modify storage gm4_garden_variety:data/garden_variety_nbt convert set from entity @s Item.tag.gm4_garden_variety
function gm4_garden_variety:data/get/scores_from_nbt

# copy item nbt into storage
data modify storage gm4_garden_variety:data/modify Item set from entity @s Item

# apply lore
function gm4_garden_variety:data/lore/mutations/apply

# copy storage into item nbt
data modify entity @s Item set from storage gm4_garden_variety:data/modify Item
