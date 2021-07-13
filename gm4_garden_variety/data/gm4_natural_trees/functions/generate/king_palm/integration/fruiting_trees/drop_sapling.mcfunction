# restores the data of the sapling when breaking the block
# @s TREE_TYPE sapling AEC
# at @s align xyz
# run from TODO

kill @e[type=item,nbt={Item:{id:"minecraft:birch_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
loot spawn ~0.5 ~0.5 ~0.5 loot gm4_natural_trees:items/sapling/king_palm

# store nbt
data modify entity @s gm4_garden_variety set from storage gm4_garden_variety:data/garden_variety_nbt sapling
execute positioned ~.5 ~ ~.5 run data modify entity @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}] Item.tag.gm4_garden_variety set from entity @s data.gm4_garden_variety

# modify item lore
#TODO# execute if score tagged gm4_gv_nbt_data matches 2 as @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}] run function gm4_garden_variety:data/modify/item/add_tagged_item_lore


