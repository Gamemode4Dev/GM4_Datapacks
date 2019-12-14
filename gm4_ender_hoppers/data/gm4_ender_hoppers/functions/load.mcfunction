execute if score gm4 load matches 1 run scoreboard players set gm4_ender_hoppers load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Ender Hoppers",require:"Gamemode 4"}

execute if score gm4_ender_hoppers load matches 1 run function gm4_ender_hoppers:init
execute unless score gm4_ender_hoppers load matches 1 run schedule clear gm4_ender_hoppers:main
