# kill marker if not inside a sapling anymore
# @s = any gm4_tree_sapling
# at @s
# run from gm4_trees-1.0:sapling/process

# restore the data of the sapling and kill marker
function #gm4_trees:destroy_sapling
kill @s
