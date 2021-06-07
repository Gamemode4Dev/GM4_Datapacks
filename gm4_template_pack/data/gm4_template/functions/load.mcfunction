execute if score gm4 load.status matches 1 run scoreboard players set gm4_MODULE_ID load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"MODULE_NAME",require:"Gamemode 4"}

execute if score gm4_MODULE_ID load.status matches 1 run function gm4_MODULE_ID:init
execute unless score gm4_MODULE_ID load.status matches 1 run schedule clear gm4_MODULE_ID:main
