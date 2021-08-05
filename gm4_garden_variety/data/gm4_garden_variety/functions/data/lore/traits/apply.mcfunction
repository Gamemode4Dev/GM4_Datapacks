# generates the tree's leaf layers
# @s = Item
# run from TODO


# remove lore
function gm4_garden_variety:data/lore/traits/remove

# get traits in lore form
function gm4_garden_variety:data/lore/traits/get_traits
execute store result storage gm4_garden_variety:data/modify Item.tag.gm4_garden_variety.lore.trait_amount int 1 run scoreboard players get trait_amount gm4_gv_nbt_data

# add traits
data modify storage gm4_garden_variety:data/modify Item.tag.display.Lore append from storage gm4_garden_variety:data/item trait_lore[]

# add tag
data modify storage gm4_garden_variety:data/modify Item.tag.gm4_garden_variety.lore.show_traits set value 1b

# remove tag
tag @s remove gm4_gv_add_trait_lore
