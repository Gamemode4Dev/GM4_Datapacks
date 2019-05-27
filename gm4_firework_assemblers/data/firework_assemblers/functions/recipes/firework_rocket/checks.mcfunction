#firework assembler recipe
#@s - firework assembler with valid recipe
#called by firework_assemblers:recipe_check

#check item counts are the same
execute store result score @s gm4_fa_slot_0 run data get block ~ ~ ~ Items[{Slot:0b}].Count
execute store result score @s gm4_fa_slot_1 run data get block ~ ~ ~ Items[{Slot:1b}].Count

execute if score @s gm4_fa_slot_0 = @s gm4_fa_slot_1 run function firework_assemblers:recipes/firework_rocket/run
