execute as @a[scores={gm4_open_furnace=1..}] at @s run function gm4_soul_glass:furnace/opened_furnace

execute as @e[type=area_effect_cloud,tag=gm4_sg_smelting] at @s if block ~ ~ ~ blast_furnace{CookTime:799s,Items:[{Slot:0b,id:"minecraft:soul_sand"}]} run function gm4_soul_glass:furnace/finish_smelt

schedule function gm4_soul_glass:tick 1t
