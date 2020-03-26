execute if score gm4 load matches 1 if score gm4_custom_crafters load matches 1 run scoreboard players set gm4_blast_furnaces load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Blast Furnaces",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Blast Furnaces",require:"Custom Crafters"}

execute if score gm4_blast_furnaces load matches 1 run function gm4_blast_furnaces:init
execute unless score gm4_blast_furnaces load matches 1 run schedule clear gm4_blast_furnaces:main
execute unless score gm4_blast_furnaces load matches 1 run schedule clear gm4_blast_furnaces:tick
