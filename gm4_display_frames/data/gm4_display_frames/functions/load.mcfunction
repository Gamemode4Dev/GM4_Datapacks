execute if score gm4 load.status matches 1 if score gm4_potion_tracking load.status matches 1 run scoreboard players set gm4_display_frames load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Display Frames",require:"Gamemode 4"}
execute unless score gm4_potion_tracking load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Display Frames",require:"lib_potion_tracking"}

execute if score gm4_display_frames load.status matches 1 run function gm4_display_frames:init
execute unless score gm4_display_frames load.status matches 1 run schedule clear gm4_display_frames:main
execute unless score gm4_display_frames load.status matches 1 run schedule clear gm4_display_frames:tick
