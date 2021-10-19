execute if score gm4 load.status matches 1 run scoreboard players set gm4_live_catch load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Live Catch",require:"Gamemode 4"}

execute if score gm4_live_catch load.status matches 1 run function gm4_live_catch:init
