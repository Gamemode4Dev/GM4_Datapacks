execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 3 if score gm4_machines load.status matches 1 if score gm4_forceload load.status matches 1 run scoreboard players set gm4_hotswap_hotbars load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Hotswap Hotbars",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 3 run data modify storage gm4:log queue append value {type:"missing",module:"Hotswap Hotbars",require:"lib_custom_crafters"}
execute unless score gm4_forceload load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Hotswap Hotbars",require:"lib_forceload"}
execute unless score gm4_machines load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Hotswap Hotbars",require:"lib_machines"}

execute if score gm4_hotswap_hotbars load.status matches 1 run function gm4_hotswap_hotbars:init
