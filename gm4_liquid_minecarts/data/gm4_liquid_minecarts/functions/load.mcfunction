execute if score gm4 load.status matches 1 if score gm4_liquid_tanks load.status matches 2 run scoreboard players set gm4_liquid_minecarts load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Liquid Minecarts",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Liquid Minecarts",require:"Liquid Tanks"}

execute if score gm4_liquid_minecarts load.status matches 1 run function gm4_liquid_minecarts:init
execute unless score gm4_liquid_minecarts load.status matches 1 run schedule clear gm4_liquid_minecarts:main
