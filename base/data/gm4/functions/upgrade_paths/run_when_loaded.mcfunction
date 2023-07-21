# @s = server
# at world spawn
# scheduled from self and advancement triggers

scoreboard players set $success gm4_data 0
execute store success score $success gm4_data as @a[tag=gm4_running_upgrade_path] at @s if loaded ~ ~ ~ run function #gm4_upgrade_paths:run
execute if score $success gm4_data matches 0 if entity @a[tag=gm4_running_upgrade_path] run schedule function gm4:upgrade_paths/run_when_loaded 1t
scoreboard players reset $success gm4_data
