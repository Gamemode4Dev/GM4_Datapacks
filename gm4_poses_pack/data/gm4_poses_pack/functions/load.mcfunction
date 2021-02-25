execute if score gm4 load matches 1 if score gm4_better_armour_stands load matches 2 run scoreboard players set gm4_poses_pack load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Poses Pack",require:"Gamemode 4"}
execute unless score gm4_better_armour_stands load matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Poses Pack",require:"Better Armour Stands"}

execute if score gm4_poses_pack load matches 1 run function gm4_poses_pack:init
