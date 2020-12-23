# allows apple saplings to be planted with podzol rooting soil
# @s = sapling item that was rooted with podzol_rooting_soil
# at @s align xyz
# run from command block in forceloaded chunk, via gm4_podzol_rooting_soil:plant/custom/run_command

function gm4_apple_trees:sapling/initialize

# kill item entity
execute store result score count gm4_podzol_data run data get entity @s Item.Count
execute if score count gm4_podzol_data matches 1 run kill @s
execute if score count gm4_podzol_data matches 2.. store result entity @s Item.Count byte 1 run scoreboard players remove count gm4_podzol_data 1
