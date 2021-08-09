# generates the tree's leaf layers
# @s = Item
# run from TODO


# remove lore
function gm4_garden_variety:data/lore/mutations/remove

# get mutations in lore form
function gm4_garden_variety:data/lore/mutations/get_mutations

# add mutations
data modify storage gm4_garden_variety:data/modify Item.tag.display.Lore append from storage gm4_garden_variety:data/item mutation_lore[]

# add lore nbt
data modify storage gm4_garden_variety:data/modify Item.tag.gm4_garden_variety.lore.show_mutations set value 1b
execute store result storage gm4_garden_variety:data/modify Item.tag.gm4_garden_variety.lore.extra_lore int 1 run scoreboard players get $extra_lore gm4_gv_nbt_data
execute store result storage gm4_garden_variety:data/modify Item.tag.gm4_garden_variety.lore.mutations int 1 run scoreboard players get $mutations gm4_gv_nbt_data

# remove tag
tag @s remove gm4_gv_add_mutation_lore
