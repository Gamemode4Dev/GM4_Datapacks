execute if score gm4 load.status matches 1 run scoreboard players set gm4_cozy_campfires load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Cozy Campfires",require:"Gamemode 4"}

execute if score gm4_cozy_campfires load.status matches 1 run function gm4_cozy_campfires:init
execute unless score gm4_cozy_campfires load.status matches 1 run schedule clear gm4_cozy_campfires:main
