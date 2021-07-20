execute as @a[gamemode=!spectator] at @s if block ~ ~2 ~ ender_chest run function gm4_xp_storage:withdraw

schedule function gm4_xp_storage:tick 1t
