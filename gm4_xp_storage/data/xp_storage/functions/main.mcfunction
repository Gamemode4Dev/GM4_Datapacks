#deposit
execute as @a[gamemode=!spectator] at @s if block ~ ~-0.1 ~ ender_chest run function xp_storage:deposit_mode_check

execute as @a[gamemode=!spectator] at @s unless block ~ ~-0.1 ~ ender_chest run tag @s remove gm4_was_on_ender_chest

execute as @a[gamemode=!spectator] at @s anchored eyes run function xp_storage:point_report_ray

scoreboard players reset @a gm4_xp_end_chest

schedule function xp_storage:main 16t
