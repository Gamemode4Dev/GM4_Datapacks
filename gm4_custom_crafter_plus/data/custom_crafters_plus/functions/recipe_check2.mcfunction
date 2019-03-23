# Run from main

# oak_fence
execute as @e[tag=gm4_craftingstand,type=armor_stand,scores={gm4_itemset=1}] at @s if block ~ ~ ~ chest{Items:[{Slot:3b,id:"minecraft:oak_planks",Count:1b},{Slot:12b,id:"minecraft:oak_planks",Count:1b},{Slot:21b,id:"minecraft:oak_planks",Count:1b}]} unless block ~ ~ ~ chest{Items:[{Slot:16b}]} run scoreboard players set @s gm4_itemcrafted 1
execute as @e[tag=gm4_craftingstand,type=armor_stand,scores={gm4_itemcrafted=1}] at @s if block ~ ~ ~ chest run replaceitem block ~ ~ ~ container.3 air
execute as @e[tag=gm4_craftingstand,type=armor_stand,scores={gm4_itemcrafted=1}] at @s if block ~ ~ ~ chest run replaceitem block ~ ~ ~ container.12 air
execute as @e[tag=gm4_craftingstand,type=armor_stand,scores={gm4_itemcrafted=1}] at @s if block ~ ~ ~ chest run replaceitem block ~ ~ ~ container.21 air

# fence to oak_planks
execute as @e[tag=gm4_craftingstand,type=armor_stand,scores={gm4_itemset=1}] at @s if block ~ ~ ~ chest{Items:[{Slot:12b,id:"minecraft:oak_fence",Count:9b}]} unless block ~ ~ ~ chest{Items:[{Slot:16b}]} run scoreboard players set @s gm4_itemcrafted 2
execute as @e[tag=gm4_craftingstand,type=armor_stand,scores={gm4_itemcrafted=2}] at @s if block ~ ~ ~ chest run replaceitem block ~ ~ ~ container.12 air


# keep at the end of the function
scoreboard players set @e[scores={gm4_itemset=1..}] gm4_itemset 0
scoreboard players set @e[scores={gm4_itemcrafted=1..}] gm4_itemcrafted 0
