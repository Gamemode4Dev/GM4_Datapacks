# Clock is started by tick advancement, on_path, only active while necessary
# @s = player or server
# at @s or 0 0
# run from function, gm4_speed_paths:clock/start, or scheduled by self

execute as @a at @s run function gm4_speed_paths:apply_effects/path_check

execute if entity @a[scores={gm4_speed_paths=1..},limit=1] run schedule function gm4_speed_paths:active 8t
