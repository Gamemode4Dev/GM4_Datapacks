# checks whether the sapling is a custom sapling, and if so allows further execution
# @s apple tree sapling AEC
# at @s align xyz
# run from TODO

# drop saplings
execute if entity @s[tag=gm4_king_palm_sapling] run function gm4_garden_variety_trees:generate/king_palm/integration/fruiting_trees/drop_sapling

# store nbt
execute positioned ~.5 ~ ~.5 run data modify entity @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}] Item.tag.gm4_garden_variety set from entity @s data.gm4_garden_variety

# convert nbt to scores (only used to check for name tag)
data modify storage gm4_garden_variety:data/garden_variety_nbt convert set from entity @s data.gm4_garden_variety
function gm4_garden_variety:data/convert/nbt_to_scores

# modify item lore
execute if score $name_tag gm4_gv_nbt_data matches 1 as @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}] run function gm4_garden_variety:data/lore/mutations/apply/to_item
