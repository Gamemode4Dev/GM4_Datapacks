# @s = player, with gm4_speed_paths score
# at @s
# run from apply_effects/path_check

execute unless block ~ ~-0.9 ~ minecraft:dirt_path run scoreboard players remove @s gm4_speed_paths 1
execute if block ~ ~-0.9 ~ minecraft:dirt_path run scoreboard players set @s gm4_speed_paths 4

execute if score @s gm4_speed_paths matches ..0 run function gm4_speed_paths:apply_effects/remove_speed
