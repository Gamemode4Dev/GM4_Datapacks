execute if score gm4_forceload load.status matches 1 unless score gm4_potion_tracking load.status matches 1.. run scoreboard players set gm4_potion_tracking load.status 1
execute if score gm4_potion_tracking load.status matches 1 unless score gm4_potion_tracking_minor load.status matches 0.. run scoreboard players set gm4_potion_tracking_minor load.status 0

execute unless score gm4_forceload load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"lib_potion_tracking",require:"lib_forceload"}
