# @s = any item entity
# at world spawn
# called from gm4_podzol_rooting_soil:process_saplings

# tag saplings
execute store success score success gm4_podzol_data if entity @s[nbt={Item:{id:"minecraft:oak_sapling"}}] run tag @s add gm4_oak_sapling
execute unless score success gm4_podzol_data matches 1.. store success score success gm4_podzol_data if entity @s[nbt={Item:{id:"minecraft:dark_oak_sapling"}}] run tag @s add gm4_dark_oak_sapling
execute unless score success gm4_podzol_data matches 1.. store success score success gm4_podzol_data if entity @s[nbt={Item:{id:"minecraft:birch_sapling"}}] run tag @s add gm4_birch_sapling
execute unless score success gm4_podzol_data matches 1.. store success score success gm4_podzol_data if entity @s[nbt={Item:{id:"minecraft:spruce_sapling"}}] run tag @s add gm4_spruce_sapling
execute unless score success gm4_podzol_data matches 1.. store success score success gm4_podzol_data if entity @s[nbt={Item:{id:"minecraft:jungle_sapling"}}] run tag @s add gm4_jungle_sapling
execute unless score success gm4_podzol_data matches 1.. store success score success gm4_podzol_data if entity @s[nbt={Item:{id:"minecraft:acacia_sapling"}}] run tag @s add gm4_acacia_sapling
execute unless score success gm4_podzol_data matches 1.. store success score success gm4_podzol_data if entity @s[nbt={Item:{id:"minecraft:cherry_sapling"}}] run tag @s add gm4_cherry_sapling
execute unless score success gm4_podzol_data matches 1.. store success score success gm4_podzol_data if entity @s[nbt={Item:{id:"minecraft:mangrove_propagule"}}] run tag @s add gm4_mangrove_propagule

# mark saplings and not saplings
execute if score success gm4_podzol_data matches 1 run tag @s add gm4_sapling
execute unless score success gm4_podzol_data matches 1 run tag @s add gm4_not_a_sapling

# reset fake players
scoreboard players reset success gm4_podzol_data
