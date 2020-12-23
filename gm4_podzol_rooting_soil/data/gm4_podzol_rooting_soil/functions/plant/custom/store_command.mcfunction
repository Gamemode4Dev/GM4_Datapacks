# @s = custom sapling item on podzol and within air-like block that has passed the randomizer
# at @s
# called from gm4_podzol_rooting_soil:plant/normal

data modify storage gm4_podzol_rooting_soil:backlog Commands append from entity @s Item.tag.gm4_podzol_rooting_soil.PlantCommand
tag @s add gm4_custom_rooted_sapling

schedule function gm4_podzol_rooting_soil:plant/custom/run_command 1t
