# checks whether @s is a gm4 king palm fruit leaf, and if so allows further evaluation of the age
# @s any gm4_fruiting_leaf
# at @s align xyz
# run from #gm4_fruiting_trees:tree/leaf/fruiting/age

# replace the data of the sapling
function #gm4_fruiting_trees:sapling/restore_data

# kill
kill @s
