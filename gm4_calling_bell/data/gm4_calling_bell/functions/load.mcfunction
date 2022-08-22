execute if score gm4 load.status matches 1 run scoreboard players set gm4_calling_bell load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4_log queue append value {type:"missing",module:"Calling Bell",require:"Gamemode 4"}

execute if score gm4_calling_bell load.status matches 1 run function gm4_calling_bell:init
execute unless score gm4_calling_bell load.status matches 1 run schedule clear gm4_calling_bell:main