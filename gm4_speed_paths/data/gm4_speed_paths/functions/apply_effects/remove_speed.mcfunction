# Removes the Speed Path attribute speed and on_path tag
# @s = player, 2 after no longer being on a speed path
# at @s
# run from function, apply_effects/path_check

attribute @s minecraft:generic.movement_speed modifier remove dc33007e-5da4-4fad-a850-9c5a058c22ba

scoreboard players reset @s gm4_speed_paths
