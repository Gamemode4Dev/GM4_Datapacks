# Starts clock if not enabled
# @s = player, stepping on dirt_path
# at @s
# run from advancement, gm4_speed_paths:on_path

execute store result score $running gm4_speed_paths run schedule clear gm4_speed_paths:main
execute if score $running gm4_speed_paths matches 1 run schedule function gm4_speed_paths:main 8t
execute if score $running gm4_speed_paths matches 0 run function gm4_speed_paths:main

scoreboard players reset $running gm4_speed_paths
