execute if score gm4 load.status matches 1 run scoreboard players set gm4_liquid_tanks load.status 2
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Liquid Tanks",require:"Gamemode 4"}

execute if score gm4_liquid_tanks load.status matches 2 run function gm4_liquid_tanks:init
execute unless score gm4_liquid_tanks load.status matches 2 run schedule clear gm4_liquid_tanks:main
