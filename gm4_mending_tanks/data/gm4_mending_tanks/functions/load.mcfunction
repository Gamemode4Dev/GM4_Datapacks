execute if score gm4 load.status matches 1 if score gm4_liquid_tanks load.status matches 1..2 run scoreboard players set gm4_mending_tanks load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Mending Tanks",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load.status matches 1..2 run data modify storage gm4:log queue append value {type:"missing",module:"Mending Tanks",require:"Liquid Tanks"}

execute if score gm4_mending_tanks load.status matches 1 run function gm4_mending_tanks:init
