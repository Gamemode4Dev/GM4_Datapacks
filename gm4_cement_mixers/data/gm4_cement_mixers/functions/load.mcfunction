execute if score gm4 load.status matches 1 if score gm4_liquid_tanks load.status matches 1 run scoreboard players set gm4_cement_mixers load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Cement Mixers",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Cement Mixers",require:"Liquid Tanks"}

execute if score gm4_cement_mixers load.status matches 1 run function gm4_cement_mixers:init
