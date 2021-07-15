# handles operations on TREE_TYPE sapling leaves
# @s = any TREE_TYPE sapling leaf
# at @s align xyz positioned at the leaf block
# run from gm4_natural_trees:main

advancement grant @a[distance=..30] only gm4:encounter_tree

execute unless block ~ ~ ~ #minecraft:leaves run function gm4_natural_trees:generate/king_palm/integration/fruiting_trees/sapling_leaf/destroy
