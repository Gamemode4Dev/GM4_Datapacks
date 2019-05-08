# @s = gm4_pulverizer if block ~ ~ ~ dropper{Items:[{Slot:0b}]}
#Run from main

#store number of full slots
execute store result score @s gm4_slot_count run data get block ~ ~ ~ Items

#get number of items from first array element
execute if score @s gm4_slot_count matches 1 store result score @s gm4_stack_size run data get block ~ ~ ~ Items[0].Count

#Tell crafters with valid contents to run recipe checks
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches 1.. run function #pulverizers:recipe_check

#check if one of the recipes succeeded
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches 1.. if block ~ ~ ~ dropper{Items:[{tag:{gm4_pulverizers:{}}}]} run function pulverizers:apply_multiplier
