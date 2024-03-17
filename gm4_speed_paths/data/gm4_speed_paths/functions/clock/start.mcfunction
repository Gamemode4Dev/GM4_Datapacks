# Starts clock if not enabled
# @s = player, stepping on dirt_path
# at @s
# run from advancement, step_on_path or rejoin

advancement revoke @s only gm4_speed_paths:step_on_path
advancement revoke @s only gm4_speed_paths:rejoin

# Refresh rejoined players
scoreboard players reset @s gm4_speed_paths_leave
scoreboard players reset @s gm4_speed_paths

execute unless entity @a[scores={gm4_speed_paths=1..},limit=1] run function gm4_speed_paths:active
