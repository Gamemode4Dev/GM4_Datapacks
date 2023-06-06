schedule function gm4_apple_trees:main 16t

# upgrade old entities
execute as @e[type=armor_stand,tag=gm4_apple_leaf] run function gm4_apple_trees:upgrade_path/apple_leaf_markers

# process apples
execute as @e[type=armor_stand,tag=gm4_apple_uninitialized] run function gm4_apple_trees:leaf/initialize
execute as @e[type=armor_stand,tag=gm4_apple] at @s align xyz run function gm4_apple_trees:leaf/process

# process golden apples
execute as @e[type=armor_stand,tag=gm4_golden_apple_uninitialized] run function gm4_golden_apple_trees:leaf/initialize
execute as @e[type=armor_stand,tag=gm4_golden_apple] at @s run function gm4_golden_apple_trees:leaf/process
# process golden roots
execute as @e[type=marker,tag=gm4_golden_root_uninitialized] at @s run function gm4_golden_apple_trees:root/initialize
execute as @e[type=marker,tag=gm4_golden_root] at @s run function gm4_golden_apple_trees:root/process
