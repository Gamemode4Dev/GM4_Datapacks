# Ensures this 1t clock runs unless there are no auto toggle markers remaining
# @s = none
# at world spawn
# scheduled from gm4_double_doors:<wood type>/door/<hinge>/<facing>/initialize_auto_toggle_marker functions when an auto toggle marker is spawned

# maintain auto toggle markers
execute as @e[type=marker,tag=gm4_double_doors_auto_toggle_marker] at @s align xyz run function gm4_double_doors:auto_toggle_marker/maintain

# reschedule if an auto toggle marker was found
execute if score $found_auto_toggle_marker gm4_double_doors_data matches 1.. run schedule function gm4_double_doors:auto_toggle_marker/find 1t
scoreboard players reset $found_auto_toggle_marker gm4_double_doors_data
