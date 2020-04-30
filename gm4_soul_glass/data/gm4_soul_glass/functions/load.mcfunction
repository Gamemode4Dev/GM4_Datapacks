execute if score gm4 load matches 1 run scoreboard players set gm4_soul_glass load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Soul Glass",require:"Gamemode 4"}

execute if score gm4_soul_glass load matches 1 run function gm4_soul_glass:init
execute unless score gm4_soul_glass load matches 1 run schedule clear gm4_soul_glass:main
execute unless score gm4_soul_glass load matches 1 run schedule clear gm4_soul_glass:beacon_clock
