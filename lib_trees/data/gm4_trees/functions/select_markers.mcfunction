
# upgrade old entities
execute if entity @s[tag=gm4_fruiting_sapling] run function #gm4_trees:upgrade_fruiting_to_general

# process saplings
execute if entity @s[tag=gm4_tree_sapling] run function gm4_trees:sapling/process
# process leaves
execute if entity @s[tag=gm4_tree_leaf] if block ~ ~ ~ #gm4_trees:empty_block run function #gm4_trees:destroy_leaf
