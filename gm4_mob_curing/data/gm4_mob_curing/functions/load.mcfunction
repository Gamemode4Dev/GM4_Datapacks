execute if score gm4 load.status matches 1 if score gm4_trades load.status matches 1 if score gm4_trades_minor load.status matches 2.. run scoreboard players set gm4_mob_curing load.status 1
execute unless score gm4_trades load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Mob Curing",require:"lib_trades"}
execute if score gm4_trades load.status matches 1 unless score gm4_trades_minor load.status matches 2.. run data modify storage gm4:log queue append value {type:"missing",module:"Mob Curing",require:"lib_trades"}
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Mob Curing",require:"Gamemode 4"}

execute if score gm4_mob_curing load.status matches 1 run function gm4_mob_curing:init
execute unless score gm4_mob_curing load.status matches 1 run schedule clear gm4_mob_curing:main
