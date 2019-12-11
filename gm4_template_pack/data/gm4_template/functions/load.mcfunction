execute if score gm4 load matches 1 run scoreboard players set gm4_MODULE_ID load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"MODULE NAME",require:"Gamemode 4"}

execute if score gm4_MODULE_ID load matches 1 run function MODULE_ID:init
execute unless score gm4_MODULE_ID load matches 1 run schedule clear MODULE_ID:main
