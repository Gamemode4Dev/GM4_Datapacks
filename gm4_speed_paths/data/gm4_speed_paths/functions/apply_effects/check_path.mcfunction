# checks if the player is still on a speed path
# @s = player, with gm4_on_path tag
# at @s
# run from main

execute positioned ~ ~1 ~ run particle minecraft:entity_effect ^ ^ ^0.2 0.75 0.9 1 0.8 0
execute if entity @s[scores={gm4_speed_paths=1..}] unless block ~ ~-0.9 ~ minecraft:grass_path run scoreboard players operation @s gm4_speed_paths -= #5 gm4_speed_paths
execute if block ~ ~-0.9 ~ minecraft:grass_path run scoreboard players set @s gm4_speed_paths 40

execute at @s[scores={gm4_speed_paths=..0}] run function gm4_speed_paths:apply_effects/remove_speed
