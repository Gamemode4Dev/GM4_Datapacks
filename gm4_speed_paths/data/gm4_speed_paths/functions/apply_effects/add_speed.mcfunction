# @s = player upon stepping on a speed path, without gm4_speed_paths score
# at @s
# run from apply_effects/path_check

scoreboard players set @s gm4_speed_paths 4
attribute @s minecraft:generic.movement_speed modifier add dc33007e-5da4-4fad-a850-9c5a058c22ba gm4_speed_paths_speed_boost 0.2 multiply_base
