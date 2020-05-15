execute if score gm4 load matches 1 run scoreboard players set gm4_poses load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Poses",require:"Gamemode 4"}

execute if score gm4_poses load matches 1 run function gm4_poses:init
execute unless score gm4_poses load matches 1 run schedule clear gm4_poses:main
execute unless score gm4_poses load matches 1 run schedule clear gm4_poses:tick
