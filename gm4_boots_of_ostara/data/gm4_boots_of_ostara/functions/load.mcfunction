execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 1 run scoreboard players set gm4_boots_of_ostara load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Boots Of Ostara",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Boots Of Ostara",require:"Custom Crafters"}

execute if score gm4_boots_of_ostara load.status matches 1 run function gm4_boots_of_ostara:init
execute unless score gm4_boots_of_ostara load.status matches 1 run schedule clear gm4_boots_of_ostara:main
