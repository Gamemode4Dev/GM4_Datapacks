execute if score gm4 load matches 1 run scoreboard players set gm4_boat_chests load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"boat chests",require:"Gamemode 4"}

execute if score gm4_boat_chests load matches 1 run function gm4_boat_chests:init
execute unless score gm4_boat_chests load matches 1 run schedule clear gm4_boat_chests:main
