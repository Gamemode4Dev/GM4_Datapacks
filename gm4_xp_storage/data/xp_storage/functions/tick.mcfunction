#withdraw
execute as @a[gamemode=!spectator] at @s if block ~ ~2 ~ ender_chest run function xp_storage:withdraw

schedule function xp_storage:tick 1t
