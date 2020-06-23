execute if score gm4 load matches 1 run scoreboard players set gm4_endermen_deactivators load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Endermen Deactivators",require:"Gamemode 4"}

execute if score gm4_endermen_deactivators load matches 1 run function gm4_endermen_deactivators:init
execute unless score gm4_endermen_deactivators load matches 1 run schedule clear gm4_endermen_deactivators:main
