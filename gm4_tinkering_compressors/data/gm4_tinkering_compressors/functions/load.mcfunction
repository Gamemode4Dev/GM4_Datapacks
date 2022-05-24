execute if score gm4 load.status matches 1 if score gm4_block_compressors load.status matches 1 if score gm4_metallurgy load.status matches 1 if score gm4_custom_crafters load.status matches 2 if score gm4_machines load.status matches 1 run scoreboard players set gm4_tinkering_compressors load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tinkering Compressors",require:"Gamemode 4"}
execute unless score gm4_block_compressors load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tinkering Compressors",require:"Block Compressors"}
execute unless score gm4_metallurgy load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tinkering Compressors",require:"Metallurgy"}
execute unless score gm4_custom_crafters load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Tinkering Compressors",require:"Custom Crafters"}
execute unless score gm4_machines load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tinkering Compressors",require:"lib_machines"}

execute if score gm4_tinkering_compressors load.status matches 1 run function gm4_tinkering_compressors:init
execute unless score gm4_tinkering_compressors load.status matches 1 run schedule clear gm4_tinkering_compressors:main
execute unless score gm4_tinkering_compressors load.status matches 1 run schedule clear gm4_tinkering_compressors:tick
