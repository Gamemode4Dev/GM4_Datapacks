# reverts the sapling to stage=0
# @s = sapling marker
# at @s align xyz
# run from gm4_trees:sapling/process

# prevent normal tree from spawning
execute if block ~ ~ ~ minecraft:oak_sapling run setblock ~ ~ ~ minecraft:oak_sapling[stage=0]
execute if block ~ ~ ~ minecraft:birch_sapling run setblock ~ ~ ~ minecraft:birch_sapling[stage=0]
execute if block ~ ~ ~ minecraft:spruce_sapling run setblock ~ ~ ~ minecraft:spruce_sapling[stage=0]
execute if block ~ ~ ~ minecraft:jungle_sapling run setblock ~ ~ ~ minecraft:jungle_sapling[stage=0]
execute if block ~ ~ ~ minecraft:acacia_sapling run setblock ~ ~ ~ minecraft:acacia_sapling[stage=0]
execute if block ~ ~ ~ minecraft:dark_oak_sapling run setblock ~ ~ ~ minecraft:dark_oak_sapling[stage=0]

# advance stage of custom sapling, if stage is large enough, grow the tree
scoreboard players add @s gm4_sap_stage 1
execute if score @s gm4_sap_stage >= @s gm4_sap_growth run function #gm4_trees:generate_tree
