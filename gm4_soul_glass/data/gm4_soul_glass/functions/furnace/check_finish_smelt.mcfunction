#@s = none
#run from furnace/prep_finish_smelt

execute as @e[type=marker,tag=gm4_sg_smelting] at @s if block ~ ~ ~ blast_furnace{CookTime:799s,Items:[{Slot:0b,id:"minecraft:soul_sand"}]} run function gm4_soul_glass:furnace/finish_smelt

execute if entity @e[tag=gm4_sg_smelting] run schedule function gm4_soul_glass:furnace/check_finish_smelt 1t
