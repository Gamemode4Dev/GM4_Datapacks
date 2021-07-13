execute if score gm4 load matches 1 if score gm4_garden_variety load matches 1 run scoreboard players set gm4_natural_trees load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Natural Trees",require:"Gamemode 4"}
execute unless score gm4_garden_variety load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Natural Trees",require:"Garden Variety"}

execute if score gm4_natural_trees load matches 1 run function gm4_natural_trees:init
execute unless score gm4_natural_trees load matches 1 run schedule clear gm4_natural_trees:main
