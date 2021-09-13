# processes the sapling that has been broken
# @s = @e[type=marker,tag=gm4_gv_sapling]
# at @s align xyz
# run from gm4_garden_variety_trees:integration/garden_variety/mechanics/custom_sapling/destroy


# kill sapling item and spawn correct sapling
kill @e[type=item,nbt={Item:{id:"minecraft:birch_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
loot spawn ~0.5 ~0.5 ~0.5 loot gm4_garden_variety_trees:items/sapling/king_palm
