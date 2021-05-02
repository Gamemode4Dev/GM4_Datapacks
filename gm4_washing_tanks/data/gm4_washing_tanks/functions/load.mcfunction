execute if score gm4 load matches 1 if score gm4_liquid_tanks load matches 1 run scoreboard players set gm4_washing_tanks load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Washing Tanks",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Washing Tanks",require:"Liquid Tanks"}

execute if score gm4_washing_tanks load matches 1 run function gm4_washing_tanks:init
