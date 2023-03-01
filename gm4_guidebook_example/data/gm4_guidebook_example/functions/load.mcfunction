execute if score gm4 load.status matches 1 run scoreboard players set gm4_guidebook_example load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Guidebook",require:"Gamemode 4"}
