execute if score gm4 load matches 1 if score gm4_custom_crafters load matches 1 run scoreboard players set gm4_record_crafting load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Record Crafting",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Record Crafting",require:"Custom Crafters"}

execute if score gm4_record_crafting load matches 1 run function record_crafting:init
