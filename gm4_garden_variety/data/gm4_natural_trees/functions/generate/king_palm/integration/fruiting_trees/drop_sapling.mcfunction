# restores the data of the sapling when breaking the block
# @s TREE_TYPE sapling AEC
# at @s align xyz
# run from TODO

kill @e[type=item,nbt={Item:{id:"minecraft:birch_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
loot spawn ~0.5 ~0.5 ~0.5 loot gm4_natural_trees:items/sapling/king_palm

# store nbt
execute positioned ~.5 ~ ~.5 run data modify entity @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}] Item.tag.gm4_garden_variety set from entity @s data.gm4_garden_variety

# convert nbt to scores (only used to check for name tag)
data modify storage gm4_garden_variety:data/garden_variety_nbt convert set from entity @s data.gm4_garden_variety
function gm4_garden_variety:data/convert/nbt_to_scores

# modify item lore
execute if score $name_tag gm4_gv_nbt_data matches 1 as @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}] run function gm4_garden_variety:data/lore/mutations/apply/to_item
