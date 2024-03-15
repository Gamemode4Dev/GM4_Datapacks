# Checks if the player is (still) on a speed path, otherwise break
# @s = player
# at @s
# run from function, active

execute unless score @s gm4_speed_paths matches 1.. unless block ~ ~-0.9 ~ minecraft:dirt_path run return 0
execute unless score @s gm4_speed_paths matches 1.. run function gm4_speed_paths:apply_effects/add_speed

execute if score @s gm4_speed_paths matches 1.. run function gm4_speed_paths:apply_effects/keep_check
