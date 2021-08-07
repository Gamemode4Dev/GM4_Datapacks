# generates the tree's leaf layers
# @s = Item
# run from TODO

# get traits
data remove storage gm4_garden_variety:data/garden_variety nbt
data modify storage gm4_garden_variety:data/garden_variety nbt set from block ~ ~ ~ Items[{Slot:1b}].tag.gm4_garden_variety
function gm4_garden_variety:data/get/scores_from_nbt

# copy item nbt into storage
data modify storage gm4_garden_variety:data/modify Item set from block ~ ~ ~ Items[{Slot:1b}]

# remove lore
execute store result score $extra gm4_lore run data get block ~ ~ ~ Items[{Slot:1b}].tag.gm4_garden_variety.lore.trait_amount
function gm4_garden_variety:data/lore/traits/remove

# copy storage into item nbt
data modify block ~ ~ ~ Items[{Slot:1b}] set from storage gm4_garden_variety:data/modify Item