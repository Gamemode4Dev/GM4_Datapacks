#@s = pulverizers containing a recipe results
#Run from apply_multiplier

function pulverizers:chance/calculate_chance
function pulverizers:chance/set_slot

scoreboard players operation @s gm4_stack_size = chance_stack gm4_stack_size
execute if block ~ ~ ~ dropper{Items:[{Slot:7b,tag:{gm4_pulverizers:{chance:1}}}]} store result block ~ ~ ~ Items[0].Count byte 1 run scoreboard players get @s gm4_stack_size