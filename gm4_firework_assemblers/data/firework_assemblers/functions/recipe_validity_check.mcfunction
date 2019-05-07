# @s = gm4_firework_assembler unless block ~ ~ ~ minecraft:dropper{Items:[]}
#Run from main

#audiovisuals
particle minecraft:smoke ~ ~1.2 ~ 0 .1 0 0 10 normal @a

#store number of full slots
execute store result score @s gm4_fa_slot_cnt run data get block ~ ~ ~ Items

#run recipe checks
function #firework_assemblers:recipe_check
