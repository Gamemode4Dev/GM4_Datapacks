execute if score gm4 load matches 1 if score gm4_custom_crafters load matches 1 run scoreboard players set gm4_lightning_rods load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Lightning Rods",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Lightning Rods",require:"Custom Crafters"}

execute if score gm4_lightning_rods load matches 1 run function gm4_lightning_rods:init
execute unless score gm4_lightning_rods load matches 1 run schedule clear gm4_lightning_rods:main
