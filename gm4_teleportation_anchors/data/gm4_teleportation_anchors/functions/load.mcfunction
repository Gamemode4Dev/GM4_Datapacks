execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 2 if score gm4_machines load.status matches 1 run scoreboard players set gm4_teleportation_anchors load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Teleportation Anchors",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Teleportation Anchors",require:"Custom Crafters"}
execute unless score gm4_machines load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Teleportation Anchors",require:"lib_machines"}

execute if score gm4_teleportation_anchors load.status matches 1 run function gm4_teleportation_anchors:init
execute unless score gm4_teleportation_anchors load.status matches 1 run schedule clear gm4_teleportation_anchors:main
execute unless score gm4_teleportation_anchors load.status matches 1 run schedule clear gm4_teleportation_anchors:tick
