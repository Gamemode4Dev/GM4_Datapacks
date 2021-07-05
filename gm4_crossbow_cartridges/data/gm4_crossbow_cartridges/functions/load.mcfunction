execute if score gm4 load.status matches 1 run scoreboard players set gm4_crossbow_cartridges load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Crossbow Cartridges",require:"Gamemode 4"}

execute if score gm4_crossbow_cartridges load.status matches 1 run function gm4_crossbow_cartridges:init
