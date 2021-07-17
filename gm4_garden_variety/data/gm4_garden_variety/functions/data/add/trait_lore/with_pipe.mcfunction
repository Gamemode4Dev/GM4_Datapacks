# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from TODO


# copy item nbt into storage
data modify storage gm4_garden_variety:data/modify Item set from entity @s Item
# add spacer and header lore
data modify storage gm4_garden_variety:data/modify Item.tag.display.Lore append value '{"text":"Name Tag","color":"#CFAE6D","italic":false}'
# append trait lore
function gm4_garden_variety:data/get/trait_lore/with_pipe
data modify storage gm4_garden_variety:data/modify Item.tag.display.Lore append from storage gm4_garden_variety:data/item_lore traits[]
# add tagged tag
data modify storage gm4_garden_variety:data/modify Item.tag.gm4_garden_variety.analyzer.tagged set value 1b
# copy storage into item nbt
data modify entity @s Item set from storage gm4_garden_variety:data/modify Item
