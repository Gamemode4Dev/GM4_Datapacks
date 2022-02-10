execute if score gm4 load.status matches 1 if score gm4_better_armour_stands load.status matches 2 run scoreboard players set gm4_poses_pack load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Poses Pack",require:"Gamemode 4"}
execute unless score gm4_better_armour_stands load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Poses Pack",require:"Better Armour Stands"}

execute if score gm4_poses_pack load.status matches 1 run function gm4_poses_pack:init
