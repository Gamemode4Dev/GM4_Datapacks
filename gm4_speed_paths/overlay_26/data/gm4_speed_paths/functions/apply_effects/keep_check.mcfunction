# checks if player is still on speed path
# @s = player, with tag gm4_on_path
# at @s
# run from function, apply_effects/path_check

execute if score @s gm4_speed_paths matches 1.. unless block ~ ~-0.9 ~ minecraft:dirt_path run scoreboard players remove @s gm4_speed_paths 1
execute if block ~ ~-0.9 ~ minecraft:dirt_path run scoreboard players set @s gm4_speed_paths 2

execute if score @s gm4_speed_paths matches ..0 run function gm4_speed_paths:apply_effects/remove_speed
