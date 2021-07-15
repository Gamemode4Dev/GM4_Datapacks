# removes an TREE_TYPE sapling leaf armor stand if it is not inside a leaf anymore
# @s = any TREE_TYPE sapling leaf
# at @s align xyz positioned at the leaf block
# run from gm4_natural_trees:trees/TREE_TYPE/fruiting/leaf/sapling/destroy

# spawn items
loot spawn ~0.5 ~ ~0.5 loot gm4_natural_trees:blocks/sapling_leaf/king_palm

# decode and store score in item nbt
#TODO# function gm4_garden_variety:data/convert/gv_string_to_scores
#execute positioned ~.5 ~ ~.5 as @e[type=item,distance=..1,sort=nearest,nbt={Age:0s}] run function gm4_garden_variety:data/convert/gv_scores_to_nbt


# kill
kill @s
