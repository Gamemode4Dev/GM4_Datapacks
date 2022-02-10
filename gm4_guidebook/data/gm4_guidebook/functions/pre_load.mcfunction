execute if score gm4 load.status matches 1 if score gm4_forceload load.status matches 1 run scoreboard players set gm4_guidebook load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Guidebook",require:"Gamemode 4"}
execute unless score gm4_forceload load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Guidebook",require:"lib_forceload"}
