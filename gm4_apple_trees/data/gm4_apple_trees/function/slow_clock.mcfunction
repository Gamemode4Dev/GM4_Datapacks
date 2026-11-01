schedule function gm4_apple_trees:slow_clock 60s

execute as @e[type=item_display,tag=gm4_apple] run function gm4_apple_trees:leaf/age
execute as @e[type=item_display,tag=gm4_golden_apple] run function gm4_golden_apple_trees:leaf/age

# allow golden apples to grow even in unloaded chunks
scoreboard players add $global_fruit_age gm4_global_age 1
