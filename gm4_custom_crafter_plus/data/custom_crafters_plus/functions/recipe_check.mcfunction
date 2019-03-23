#Run from main

# oak_fence
execute as @e[tag=gm4_craftingstand,type=armor_stand] at @s if block ~ ~ ~ chest{Items:[{Slot:3b,id:"minecraft:oak_planks",Count:1b},{Slot:12b,id:"minecraft:oak_planks",Count:1b},{Slot:21b,id:"minecraft:oak_planks",Count:1b}]} run scoreboard players set @s gm4_recipe_valid 1
execute as @e[tag=gm4_craftingstand,type=armor_stand,scores={gm4_recipe_valid=1}] at @s if block ~ ~ ~ chest store success score @s gm4_itemset run replaceitem block ~ ~ ~ container.16 minecraft:oak_fence 9
execute as @e[tag=gm4_craftingstand,type=armor_stand] unless entity @s[scores={gm4_recipe_valid=1..}] at @s if block ~ ~ ~ chest run replaceitem block ~ ~ ~ container.16 minecraft:air

# fence to oak_planks
execute as @e[tag=gm4_craftingstand,type=armor_stand] at @s if block ~ ~ ~ chest{Items:[{Slot:12b,id:"minecraft:oak_fence",Count:9b}]} run scoreboard players set @s gm4_recipe_valid 2
execute as @e[tag=gm4_craftingstand,type=armor_stand,scores={gm4_recipe_valid=2}] at @s if block ~ ~ ~ chest store success score @s gm4_itemset run replaceitem block ~ ~ ~ container.16 minecraft:oak_planks 3
execute as @e[tag=gm4_craftingstand,type=armor_stand] unless entity @s[scores={gm4_recipe_valid=1..}] at @s if block ~ ~ ~ chest run replaceitem block ~ ~ ~ container.16 minecraft:air


# keep at the end of the function
scoreboard players set @e[scores={gm4_recipe_valid=1..}] gm4_recipe_valid 0
