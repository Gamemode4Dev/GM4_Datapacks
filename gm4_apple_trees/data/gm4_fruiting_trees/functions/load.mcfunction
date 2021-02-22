execute if score gm4 load matches 1 run scoreboard players set gm4_fruiting_trees load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Apple Trees",require:"Gamemode 4"}

execute if score gm4_fruiting_trees load matches 1 run function gm4_fruiting_trees:init
execute unless score gm4_fruiting_trees load matches 1 run schedule clear gm4_fruiting_trees:main
execute unless score gm4_fruiting_trees load matches 1 run schedule clear gm4_fruiting_trees:tick
