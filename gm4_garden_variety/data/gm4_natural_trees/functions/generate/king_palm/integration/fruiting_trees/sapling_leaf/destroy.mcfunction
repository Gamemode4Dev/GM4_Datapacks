# removes an TREE_TYPE sapling leaf armor stand if it is not inside a leaf anymore
# @s = any TREE_TYPE sapling leaf
# at @s align xyz positioned at the leaf block
# run from gm4_natural_trees:trees/TREE_TYPE/fruiting/leaf/sapling/destroy

# spawn items
loot spawn ~0.5 ~ ~0.5 loot gm4_natural_trees:blocks/sapling_leaf/king_palm

# store nbt
data modify storage gm4_garden_variety:data/garden_variety nbt set from entity @s data.gm4_garden_variety
data remove storage gm4_garden_variety:data/garden_variety nbt.lore
execute as @e[type=item,distance=..1,sort=nearest,nbt={Age:0s}] run data modify entity @s Item.tag.gm4_garden_variety set from storage gm4_garden_variety:data/garden_variety nbt

# kill
kill @s
