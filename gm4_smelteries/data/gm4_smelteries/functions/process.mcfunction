# smeltery processes
# @s = smeltery
# run from main

# update smeltery state
execute if block ~ ~ ~ furnace[lit=true] run function gm4_smelteries:furnace_lit
execute unless block ~ ~ ~ furnace[lit=true] if entity @s[tag=gm4_smeltery_lit] run function gm4_smelteries:furnace_unlit
