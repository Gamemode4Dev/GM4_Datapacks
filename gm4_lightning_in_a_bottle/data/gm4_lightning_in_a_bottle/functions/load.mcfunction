execute if score gm4 load.status matches 1 run scoreboard players set lightning_in_a_bottle load.status 1
execute unless score gm4_brewing load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Lightning in a Bottle",require:"lib_brewing"}
execute unless score gm4_forceload load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Lightning in a Bottle",require:"lib_forceload"}
execute unless score gm4_potion_tracking load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Lightning in a Bottle",require:"lib_potion_tracking"}
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Lightning in a Bottle",require:"Gamemode 4"}

execute if score lightning_in_a_bottle load.status matches 1 run function gm4_lightning_in_a_bottle:init
execute unless score lightning_in_a_bottle load.status matches 1 run schedule clear gm4_lightning_in_a_bottle:main
