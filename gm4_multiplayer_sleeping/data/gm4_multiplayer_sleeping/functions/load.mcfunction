execute if score gm4 load matches 1 run scoreboard players set gm4_multiplayer_sleeping load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Multiplayer Sleeping",require:"Gamemode 4"}

execute if score gm4_multiplayer_sleeping load matches 1 run function gm4_multiplayer_sleeping:init
execute unless score gm4_multiplayer_sleeping load matches 1 run schedule clear gm4_multiplayer_sleeping:main


