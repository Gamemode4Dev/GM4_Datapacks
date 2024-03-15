# checks if the player is (still) on a speed path, otherwise break
# @s = player
# at @s
# run from main

execute if entity @s[tag=!gm4_on_path] unless function gm4_speed_paths:apply_effects/add_speed run return 0

execute if entity @s[tag=gm4_on_path] run function gm4_speed_paths:apply_effects/keep_check
