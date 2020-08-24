execute if score gm4 load matches 1 run scoreboard players set gm4_display_frames load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Display Frames",require:"Gamemode 4"}

execute if score gm4_display_frames load matches 1 run function gm4_display_frames:init
execute unless score gm4_display_frames load matches 1 run schedule clear gm4_display_frames:main
execute unless score gm4_display_frames load matches 1 run schedule clear gm4_display_frames:tick
