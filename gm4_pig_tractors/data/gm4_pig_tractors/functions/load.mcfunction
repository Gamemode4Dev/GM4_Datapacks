execute if score gm4 load.status matches 1 run scoreboard players set gm4_pig_tractors load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Pig Tractors",require:"Gamemode 4"}

execute if score gm4_pig_tractors load.status matches 1 run function gm4_pig_tractors:init
