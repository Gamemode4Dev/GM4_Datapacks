execute if score gm4 load matches 1 if score gm4_custom_crafters load matches 1 run scoreboard players set gm4_block_compressors load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Block Compressors",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Block Compressors",require:"Custom Crafters"}

execute if score gm4_block_compressors load matches 1 run function block_compressors:init
execute unless score gm4_block_compressors load matches 1 run schedule clear block_compressors:main
