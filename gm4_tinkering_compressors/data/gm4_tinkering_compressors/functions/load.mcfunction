execute if score gm4 load matches 1 if score gm4_block_compressors load matches 1 if score gm4_metallurgy load matches 1 run scoreboard players set gm4_tinkering_compressors load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tinkering Compressors",require:"Gamemode 4"}
execute unless score gm4_block_compressors load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tinkering Compressors",require:"Block Compressors"}
execute unless score gm4_metallurgy load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tinkering Compressors",require:"Metallurgy"}

execute if score gm4_tinkering_compressors load matches 1 run function gm4_tinkering_compressors:init
execute unless score gm4_tinkering_compressors load matches 1 run schedule clear gm4_tinkering_compressors:main
execute unless score gm4_tinkering_compressors load matches 1 run schedule clear gm4_tinkering_compressors:tick
