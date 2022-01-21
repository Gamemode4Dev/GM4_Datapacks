execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 2 if score gm4_machines load.status matches 1 run scoreboard players set gm4_liquid_tanks load.status 2
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Liquid Tanks",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Liquid Tanks",require:"Custom Crafters"}
execute unless score gm4_machines load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Liquid Tanks",require:"lib_machines"}

execute if score gm4_liquid_tanks load.status matches 2 run function gm4_liquid_tanks:init
execute unless score gm4_liquid_tanks load.status matches 2 run schedule clear gm4_liquid_tanks:main
