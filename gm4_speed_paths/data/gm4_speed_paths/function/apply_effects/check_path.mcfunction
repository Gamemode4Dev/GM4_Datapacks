# checks if the player is still on a speed path
# @s = player, with gm4_on_path tag
# at @s
# run from main

execute if entity @s[scores={gm4_speed_paths=1..}] unless block ~ ~-0.9 ~ minecraft:dirt_path run scoreboard players remove @s gm4_speed_paths 1
execute if block ~ ~-0.9 ~ minecraft:dirt_path run scoreboard players set @s gm4_speed_paths 5

execute at @s[scores={gm4_speed_paths=..0}] run function gm4_speed_paths:apply_effects/remove_speed
