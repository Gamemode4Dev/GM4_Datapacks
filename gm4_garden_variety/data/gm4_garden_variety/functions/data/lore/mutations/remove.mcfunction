# generates the tree's leaf layers
# @s = Item
# run from TODO


# remove lore
data remove storage gm4_lore:temp Source
data modify storage gm4_lore:temp Source set from storage gm4_garden_variety:data/modify Item.tag.display.Lore
data modify storage gm4_lore:temp Target set value '[{"text":"Sapling Mutations","color":"#BD6FFD","italic":false}]'
# NOTE: assign $extra before this function (execute store result score $extra gm4_lore run data get entity @s Item.tag.gm4_garden_variety.lore.extra_lore)
function #gm4_lore:remove
data modify storage gm4_garden_variety:data/modify Item.tag.display.Lore set from storage gm4_lore:temp Source

# set nbt
data remove storage gm4_garden_variety:data/modify Item.tag.gm4_garden_variety.lore
