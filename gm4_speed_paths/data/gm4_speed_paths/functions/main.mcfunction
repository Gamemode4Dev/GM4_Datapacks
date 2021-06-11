execute as @a[tag=!gm4_on_path] at @s if block ~ ~-0.9 ~ minecraft:dirt_path run function gm4_speed_paths:apply_effects/add_speed
execute as @a[tag=gm4_on_path] at @s run function gm4_speed_paths:apply_effects/check_path

schedule function gm4_speed_paths:main 8t
