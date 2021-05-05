execute if score gm4 load matches 1 run scoreboard players set gm4_villager_telltale load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"villager telltale",require:"Gamemode 4"}

execute if score gm4_villager_telltale load matches 1 run function gm4_villager_telltale:init
execute unless score gm4_villager_telltale load matches 1 run schedule clear gm4_villager_telltale:main
