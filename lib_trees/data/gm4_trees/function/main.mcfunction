
schedule function gm4_trees:main 8t

# process leaves
execute as @e[type=marker,tag=gm4_tree_leaf] at @s if block ~ ~ ~ #gm4_trees:empty_block run function #gm4_trees:destroy_leaf
