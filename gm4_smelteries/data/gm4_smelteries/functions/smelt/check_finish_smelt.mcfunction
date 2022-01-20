# @s = none
# run from smelt/prep_finish_smelt

execute as @e[type=marker,tag=gm4_smeltery_smelting] at @s if block ~ ~ ~ furnace{CookTime:199s} run function gm4_smelteries:smelt/finish_smelt

execute if entity @e[type=marker,tag=gm4_smeltery_smelting,limit=1] run schedule function gm4_smelteries:smelt/check_finish_smelt 1t
