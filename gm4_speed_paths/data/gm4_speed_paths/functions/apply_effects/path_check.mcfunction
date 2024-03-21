# @s = player
# at @s
# run from main

execute unless score @s gm4_speed_paths matches 1.. run function gm4_speed_paths:apply_effects/add_speed

execute if score @s gm4_speed_paths matches 1.. run function gm4_speed_paths:apply_effects/keep_check
