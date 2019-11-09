#run from arrow
#@s = arrow with hopper that is "full" beneath it, at @s

#check if any of the slots are arrows
scoreboard players set @s gm4_bh_data 0
execute if block ~ ~-.1 ~ minecraft:hopper{Items:[{Slot:0b, id:"minecraft:arrow"}]} unless block ~ ~-.1 ~ hopper{Items:[{Slot:0b, Count:64b}]} run scoreboard players add @s gm4_bh_data 1
execute if block ~ ~-.1 ~ minecraft:hopper{Items:[{Slot:1b, id:"minecraft:arrow"}]} unless block ~ ~-.1 ~ hopper{Items:[{Slot:1b, Count:64b}]} run scoreboard players add @s gm4_bh_data 1
execute if block ~ ~-.1 ~ minecraft:hopper{Items:[{Slot:2b, id:"minecraft:arrow"}]} unless block ~ ~-.1 ~ hopper{Items:[{Slot:2b, Count:64b}]} run scoreboard players add @s gm4_bh_data 1
execute if block ~ ~-.1 ~ minecraft:hopper{Items:[{Slot:3b, id:"minecraft:arrow"}]} unless block ~ ~-.1 ~ hopper{Items:[{Slot:3b, Count:64b}]} run scoreboard players add @s gm4_bh_data 1
execute if block ~ ~-.1 ~ minecraft:hopper{Items:[{Slot:4b, id:"minecraft:arrow"}]} unless block ~ ~-.1 ~ hopper{Items:[{Slot:4b, Count:64b}]} run scoreboard players add @s gm4_bh_data 1

execute if score @s gm4_bh_data > #0 gm4_bh_data run function better_hoppers:arrow/drop