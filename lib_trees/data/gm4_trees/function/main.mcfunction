
schedule function gm4_trees:main 8t

# upgrade old entities
execute as @e[type=marker,tag=gm4_fruiting_sapling] run function #gm4_trees:upgrade_fruiting_to_general

# process leaves
execute as @e[type=marker,tag=gm4_tree_leaf] at @s if block ~ ~ ~ #gm4_trees:empty_block run function #gm4_trees:destroy_leaf
