schedule function gm4_trees:tick 1t

# upgrade old entities
execute as @e[type=area_effect_cloud,tag=gm4_fruiting_sapling] at @s run function #gm4_trees:upgrade_aec_to_marker
execute as @e[type=marker,tag=gm4_fruiting_sapling] run function #gm4_trees:upgrade_fruiting_to_general

# process saplings
execute as @e[type=marker,tag=gm4_tree_sapling] at @s run function gm4_trees:sapling/process
# process leaves
execute as @e[type=marker,tag=gm4_tree_leaf] at @s if block ~ ~ ~ #gm4_trees:empty_block run function #gm4_trees:destroy_leaf
