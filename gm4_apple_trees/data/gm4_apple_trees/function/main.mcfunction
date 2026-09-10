schedule function gm4_apple_trees:main 16t

# process apples
execute as @e[type=item_display,tag=gm4_apple_uninitialized] run function gm4_apple_trees:leaf/initialize
execute as @e[type=item_display,tag=gm4_apple] at @s run function gm4_apple_trees:leaf/process

# process golden apples
execute as @e[type=item_display,tag=gm4_golden_apple_uninitialized] run function gm4_golden_apple_trees:leaf/initialize
execute as @e[type=item_display,tag=gm4_golden_apple] at @s run function gm4_golden_apple_trees:leaf/process
# process golden roots
execute as @e[type=marker,tag=gm4_golden_root_uninitialized] at @s run function gm4_golden_apple_trees:root/initialize
execute as @e[type=marker,tag=gm4_golden_root] at @s run function gm4_golden_apple_trees:root/process

# allow golden roots to grow even in unloaded chunks
scoreboard players add $global_root_age gm4_global_age 1
