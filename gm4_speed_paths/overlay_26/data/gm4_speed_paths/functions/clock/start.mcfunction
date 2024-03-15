# Starts clock if not enabled
# @s = player, stepping on dirt_path
# at @s
# run from advancement, gm4_speed_paths:on_path

advancement revoke @s only gm4_speed_paths:on_path

execute unless function gm4_speed_paths:clock/check run function gm4_speed_paths:main
