schedule function gm4_trees:tick 1t

# process saplings
execute as @e[type=marker,tag=gm4_tree_sapling] at @s run function gm4_trees:sapling/process
