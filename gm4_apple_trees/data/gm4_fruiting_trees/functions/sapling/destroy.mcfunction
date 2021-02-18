# removes an fruiting sapling AEC if it is not inside a sapling anymore
# @s = any gm4_fruiting_sapling
# at @s align xyz
# run from gm4_fruiting_trees:sapling/process

# replace the data of the sapling
function #gm4_fruiting_trees:sapling/restore_data

# kill
kill @s
