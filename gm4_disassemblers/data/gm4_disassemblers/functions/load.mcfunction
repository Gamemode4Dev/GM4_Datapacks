execute if score gm4 load matches 1 if score gm4_custom_crafters load matches 1 run scoreboard players set gm4_disassemblers load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Disassemblers",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Disassemblers",require:"Custom Crafters"}

execute if score gm4_disassemblers load matches 1 run function gm4_disassemblers:init
execute unless score gm4_disassemblers load matches 1 run schedule clear disassemblers:main
