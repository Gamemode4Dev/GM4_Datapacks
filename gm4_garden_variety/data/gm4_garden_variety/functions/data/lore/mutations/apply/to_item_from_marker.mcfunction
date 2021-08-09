# generates the tree's leaf layers
# @s = Item
# run from TODO

# convert nbt to scores
# NOTE: set "gm4_garden_variety:data/garden_variety_nbt convert" before this function
function gm4_garden_variety:data/convert/nbt_to_scores

# copy item nbt into storage
data modify storage gm4_garden_variety:data/modify Item set from entity @s Item

# apply lore
function gm4_garden_variety:data/lore/mutations/apply

# copy storage into item nbt
data modify entity @s Item set from storage gm4_garden_variety:data/modify Item
