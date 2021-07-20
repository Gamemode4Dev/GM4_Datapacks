execute as @a[gamemode=!spectator] at @s if block ~ ~-0.1 ~ ender_chest run function gm4_xp_storage:deposit_mode_check
execute as @a[gamemode=!spectator] at @s anchored eyes run function gm4_xp_storage:point_report_ray

schedule function gm4_xp_storage:main 16t
