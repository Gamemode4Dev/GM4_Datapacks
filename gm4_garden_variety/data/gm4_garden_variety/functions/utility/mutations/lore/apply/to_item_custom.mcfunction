# applies mutation lore to the item with an external source of mutations
# @s = @s[type=item]
# at @s
# run from gm4_garden_variety:mechanics/tree_generation/pre_generation


# apply lore
data modify storage gm4_garden_variety:modify/item input set from entity @s Item
function gm4_garden_variety:utility/mutations/lore/apply
data modify entity @s Item set from storage gm4_garden_variety:modify/item output
