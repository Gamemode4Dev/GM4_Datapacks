# @s = none
# run from smelt/finish_smelt

execute as @e[type=marker,tag=gm4_smelteries_smelted] at @s run function gm4_smelteries:smelt/increase_output

