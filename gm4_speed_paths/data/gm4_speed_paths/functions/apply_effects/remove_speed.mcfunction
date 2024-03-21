# @s = player, gm4_speed_paths score of 0 or less
# at @s
# run from apply_effects/path_check

attribute @s minecraft:generic.movement_speed modifier remove dc33007e-5da4-4fad-a850-9c5a058c22ba

scoreboard players reset @s gm4_speed_paths
