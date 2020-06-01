execute if score gm4 load matches 1 run scoreboard players set gm4_washing_machines load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Washing Machines",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Washing Machines",require:"Liquid Tanks"}

execute if score gm4_washing_machines load matches 1 run function gm4_washing_machines:init
