# generates the tree's leaf layers
# @s = Item
# run from TODO

# apply lore
data modify storage gm4_garden_variety:modify/item input set from entity @s Item
function gm4_garden_variety:data/mutations/lore/apply
data modify entity @s Item set from storage gm4_garden_variety:modify/item output
