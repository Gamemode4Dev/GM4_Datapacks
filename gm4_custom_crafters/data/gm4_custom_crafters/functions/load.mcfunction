execute if score gm4 load matches 1 run scoreboard players set gm4_custom_crafters load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Custom Crafters",require:"Gamemode 4"}

execute if score gm4_custom_crafters load matches 1 run function custom_crafters:init
execute unless score gm4_custom_crafters load matches 1 run schedule clear custom_crafters:main
