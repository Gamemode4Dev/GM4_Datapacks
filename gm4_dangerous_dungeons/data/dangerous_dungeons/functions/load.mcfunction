execute if score gm4 load matches 1 if score gm4_orbis load matches 1 run scoreboard players set gm4_dangerous_dungeons load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Dangerous Dungeons",require:"Gamemode 4"}
execute unless score gm4_orbis load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Dangerous Dungeons",require:"Orbis"}

execute if score gm4_dangerous_dungeons load matches 1 run function dangerous_dungeons:init
