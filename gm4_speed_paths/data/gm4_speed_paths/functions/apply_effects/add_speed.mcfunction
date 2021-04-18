# applies the Speed Paths attribute and gm4_on_path tag
# @s = player upon stepping on a speed path
# at @s
# run from main

tag @s add gm4_on_path
scoreboard players set @s gm4_speed_paths 5
attribute @s minecraft:generic.movement_speed modifier add dc33007e-5da4-4fad-a850-9c5a058c22ba gm4_speed_paths_speed_boost 0.2 multiply_base
