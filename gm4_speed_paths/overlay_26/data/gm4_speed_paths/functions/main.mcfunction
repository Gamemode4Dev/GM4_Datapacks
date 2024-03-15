# Clock is started by tick advancement, on_path, only active while necessary
# run from function, gm4_speed_paths:clock/start, or scheduled by self

execute as @a at @s run function gm4_speed_paths:apply_effects/path_check

execute if function gm4_speed_paths:clock/check run schedule function gm4_speed_paths:main 16t
