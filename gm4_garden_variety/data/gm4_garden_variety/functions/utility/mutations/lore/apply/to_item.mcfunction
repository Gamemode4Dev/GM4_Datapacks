# applies mutation lore to the item
# @s = @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}]
# at @s
# run from gm4_garden_variety:mechanics/custom_sapling/destroy

# apply lore
data modify storage gm4_garden_variety:modify/item input set from entity @s Item
data modify storage gm4_garden_variety:modify/item modifier set from entity @s Item
function gm4_garden_variety:utility/mutations/lore/apply
data modify entity @s Item set from storage gm4_garden_variety:modify/item output
