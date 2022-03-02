execute if score gm4 load.status matches 1 if score gm4_forceload load.status matches 1 if score gm4_lore load.status matches 1 run scoreboard players set gm4_combat_evolved load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Armor identification",require:"Gamemode 4"}
execute unless score gm4_forceload load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Armor identification",require:"lib_forceload"}
execute unless score gm4_lore load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Armor identification",require:"lib_lore"}

execute if score gm4_combat_evolved load.status matches 1 run function gm4_combat_evolved:init
execute unless score gm4_combat_evolved load.status matches 1 run schedule clear gm4_combat_evolved:tick
execute unless score gm4_combat_evolved load.status matches 1 run schedule clear gm4_combat_evolved:main
execute unless score gm4_combat_evolved load.status matches 1 run schedule clear gm4_combat_evolved:slow_clock
