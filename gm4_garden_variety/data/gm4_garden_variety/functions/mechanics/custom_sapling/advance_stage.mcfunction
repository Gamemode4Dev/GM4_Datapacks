# processes the sapling that has advanced stage
# @s = @e[type=marker,tag=gm4_gv_sapling]
# at @s align xyz
# run from gm4_garden_variety:mechanics\custom_sapling\process

# prevent normal tree from spawning
execute if block ~ ~ ~ minecraft:oak_sapling run setblock ~ ~ ~ minecraft:oak_sapling[stage=0]
execute if block ~ ~ ~ minecraft:birch_sapling run setblock ~ ~ ~ minecraft:birch_sapling[stage=0]
execute if block ~ ~ ~ minecraft:spruce_sapling run setblock ~ ~ ~ minecraft:spruce_sapling[stage=0]
execute if block ~ ~ ~ minecraft:jungle_sapling run setblock ~ ~ ~ minecraft:jungle_sapling[stage=0]
execute if block ~ ~ ~ minecraft:acacia_sapling run setblock ~ ~ ~ minecraft:acacia_sapling[stage=0]
execute if block ~ ~ ~ minecraft:dark_oak_sapling run setblock ~ ~ ~ minecraft:dark_oak_sapling[stage=0]

# advance stage of custom sapling, if stage is large enough, grow the tree
scoreboard players add @s gm4_gv_sap_age 1
execute if score @s gm4_gv_sap_age >= @s gm4_gv_sap_grow run function gm4_garden_variety:mechanics/custom_sapling/generate_tree
