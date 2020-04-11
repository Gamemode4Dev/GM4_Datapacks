#@s = furnace AEC
#run from main

execute unless block ~ ~ ~ blast_furnace run kill @s

execute if block ~ ~ ~ blast_furnace{Items:[{Slot:0b,id:"minecraft:soul_sand"}]} run function gm4_soul_glass:furnace/smelting
