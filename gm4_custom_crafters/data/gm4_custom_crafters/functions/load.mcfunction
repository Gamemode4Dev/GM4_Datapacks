execute if score gm4 load matches 1 run scoreboard players set gm4_custom_crafters load 2
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Custom Crafters",require:"Gamemode 4"}

execute if score gm4_custom_crafters load matches 2 run function gm4_custom_crafters:init
execute unless score gm4_custom_crafters load matches 2 run schedule clear gm4_custom_crafters:main
