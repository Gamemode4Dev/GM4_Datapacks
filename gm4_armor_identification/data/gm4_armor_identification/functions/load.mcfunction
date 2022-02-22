execute if score gm4 load.status matches 1 run scoreboard players set gm4_armor_identification load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Armor identification",require:"Gamemode 4"}

execute if score gm4_armor_identification load.status matches 1 run function gm4_armor_identification:init
execute unless score gm4_armor_identification load.status matches 1 run schedule clear gm4_armor_identification:tick
execute unless score gm4_armor_identification load.status matches 1 run schedule clear gm4_armor_identification:main
execute unless score gm4_armor_identification load.status matches 1 run schedule clear gm4_armor_identification:slow_clock
