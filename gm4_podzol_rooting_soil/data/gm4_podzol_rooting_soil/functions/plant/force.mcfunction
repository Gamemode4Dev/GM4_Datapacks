# @s = sapling item on podzol and within air-like block that has failed the randomizer
# at world spawn
# called from gm4_podzol_rooting_soil:randomizer

execute store result score age gm4_podzol_data run data get entity @s Age
execute if score age gm4_podzol_data matches 5399.. at @s if block ~ ~-1 ~ minecraft:podzol if block ~ ~ ~ #gm4:foliage run function gm4_podzol_rooting_soil:plant/normal
