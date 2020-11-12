execute if score gm4 load matches 1 run scoreboard players set gm4_teleportation_anchors load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Teleportation Anchors",require:"Gamemode 4"}

execute if score gm4_teleportation_anchors load matches 1 run function gm4_teleportation_anchors:init
execute unless score gm4_teleportation_anchors load matches 1 run schedule clear gm4_teleportation_anchors:main
execute unless score gm4_teleportation_anchors load matches 1 run schedule clear gm4_teleportation_anchors:tick
