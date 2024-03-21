execute as @a at @s run function gm4_speed_paths:apply_effects/path_check

execute if entity @a[scores={gm4_speed_paths=1..},limit=1] run schedule function gm4_speed_paths:main 8t
