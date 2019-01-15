#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = xp_storage gm4_clock_tick run function xp_storage:main
#withdraw
execute as @a[gamemode=!spectator] at @s if block ~ ~2 ~ ender_chest run function xp_storage:withdraw
