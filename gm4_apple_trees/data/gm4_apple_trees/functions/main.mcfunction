schedule function gm4_apple_trees:main 16s

# upgrade old entities
execute as @e[type=armor_stand,tag=gm4_apple_leaf] run function gm4_apple_trees:upgrade_path/apple_leaf_markers

# process fruiting leaves
execute as @e[type=armor_stand,tag=gm4_apple_uninitialized] run function gm4_apple_trees:leaf/initialize
