execute as @a run attribute @s minecraft:generic.movement_speed modifier remove dc33007e-5da4-4fad-a850-9c5a058c22ba
execute as @a at @s if block ~ ~-0.9 ~ grass_path run attribute @s minecraft:generic.movement_speed modifier add dc33007e-5da4-4fad-a850-9c5a058c22ba gm4_speed_paths_speed_boost 0.2 multiply_base

schedule function gm4_speed_paths:main 8t
