# generates the tree's leaf layers
# @s = Item
# run from TODO

# get traits
# NOTE: reset and set "gm4_garden_variety:data/garden_variety nbt" before this function
function gm4_garden_variety:data/get/scores_from_nbt

# copy item nbt into storage
data modify storage gm4_garden_variety:data/modify Item set from block ~ ~ ~ Items[{Slot:2b}]

# apply lore
execute store result score $extra gm4_lore run data get block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.lore.trait_amount
function gm4_garden_variety:data/lore/traits/apply

# copy storage into item nbt
data modify block ~ ~ ~ Items[{Slot:2b}] set from storage gm4_garden_variety:data/modify Item