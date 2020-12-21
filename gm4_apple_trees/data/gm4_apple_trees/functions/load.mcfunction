execute if score gm4 load matches 1 if score gm4_fruiting_trees load matches 1 run scoreboard players set gm4_apple_trees load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Apple Trees",require:"Gamemode 4"}
execute unless score gm4_fruiting_trees load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Apple Trees",require:"Fruiting Trees"}

execute if score gm4_apple_trees load matches 1 run function gm4_apple_trees:init
