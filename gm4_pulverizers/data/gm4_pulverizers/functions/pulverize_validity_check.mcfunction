# @s = gm4_pulverizer if block ~ ~ ~ hopper[enabled=true]{Items:[{Slot:0b}]}
#Run from main

#store stack count of first slot
execute store result score stack_size gm4_pul_data run data get block ~ ~ ~ Items[0].Count

#check recipes
scoreboard players set input_count gm4_pul_data 0
function #gm4_pulverizers:pulverize_check

#Tell pulverizers with valid recipes to run pulverize
execute if score input_count gm4_pul_data matches 1.. run function gm4_pulverizers:pulverize
