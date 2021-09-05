execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 1 if score gm4_player_heads load.status matches 1 run scoreboard players set gm4_scuba_gear load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"SCUBA Gear",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"SCUBA Gear",require:"Custom Crafters"}
execute unless score gm4_player_heads load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"SCUBA Gear",require:"lib_player_heads"}

execute if score gm4_scuba_gear load.status matches 1 run function gm4_scuba_gear:init
execute unless score gm4_scuba_gear load.status matches 1 run schedule clear gm4_scuba_gear:main
