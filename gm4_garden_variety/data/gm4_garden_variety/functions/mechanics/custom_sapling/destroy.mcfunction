# checks whether the sapling is a custom sapling, and if so allows further execution
# @s apple tree sapling AEC
# at @s align xyz
# run from TODO

# drop saplings
function #gm4_garden_variety:mechanics/custom_sapling/destroy

# store nbt
execute positioned ~.5 ~.5 ~.5 run data modify entity @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}] Item.tag.gm4_garden_variety set from entity @s data.gm4_garden_variety

# convert nbt to scores (only used to check for name tag)
data remove storage gm4_garden_variety:convert/to_scores input
data modify storage gm4_garden_variety:convert/to_scores input set from entity @s data.gm4_garden_variety
function gm4_garden_variety:data/convert/gv_nbt_to_scores

# modify item lore
execute if score $name_tag gm4_gv_nbt_data matches 1 as @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}] run function gm4_garden_variety:data/mutations/lore/apply/to_item

# kill
kill @s
