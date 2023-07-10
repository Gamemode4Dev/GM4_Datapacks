# @s = sapling item on podzol and within air-like block that has passed the randomizer
# at @s
# called from gm4_podzol_rooting_soil:randomizer and gm4_podzol_rooting_soil:plant/normal

# plant sapling
execute if entity @s[tag=gm4_oak_sapling] run setblock ~ ~ ~ minecraft:oak_sapling destroy
execute if entity @s[tag=gm4_dark_oak_sapling] run setblock ~ ~ ~ minecraft:dark_oak_sapling destroy
execute if entity @s[tag=gm4_birch_sapling] run setblock ~ ~ ~ minecraft:birch_sapling destroy
execute if entity @s[tag=gm4_spruce_sapling] run setblock ~ ~ ~ minecraft:spruce_sapling destroy
execute if entity @s[tag=gm4_jungle_sapling] run setblock ~ ~ ~ minecraft:jungle_sapling destroy
execute if entity @s[tag=gm4_acacia_sapling] run setblock ~ ~ ~ minecraft:acacia_sapling destroy
execute if entity @s[tag=gm4_cherry_sapling] run setblock ~ ~ ~ minecraft:cherry_sapling destroy
execute if entity @s[tag=gm4_mangrove_propagule] run setblock ~ ~ ~ minecraft:mangrove_propagule destroy

# plant custom sapling
execute if data entity @s Item.tag.gm4_podzol_rooting_soil run function #gm4_podzol_rooting_soil:plant_custom_sapling

# sounds and visuals
execute align xyz positioned ~.5 ~.5 ~.5 run particle minecraft:happy_villager ~ ~ ~ .3 .3 .3 1 10 normal
playsound minecraft:block.chorus_flower.grow block @a[distance=..6] ~ ~ ~ 0.2 0.8

# kill item entity
execute store result score count gm4_podzol_data run data get entity @s Item.Count
execute if score count gm4_podzol_data matches 1 run kill @s
execute if score count gm4_podzol_data matches 2.. store result entity @s Item.Count byte 1 run scoreboard players remove count gm4_podzol_data 1

# reset fake players
scoreboard players reset count gm4_podzol_data
