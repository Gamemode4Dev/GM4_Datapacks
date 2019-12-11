execute if score gm4 load matches 1 if score gm4_orbis load matches 1 run scoreboard players set gm4_tower_structures load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tower Structures",require:"Gamemode 4"}
execute unless score gm4_orbis load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tower Structures",require:"Orbis"}

execute if score gm4_tower_structures load matches 1 run function tower_structures:init
