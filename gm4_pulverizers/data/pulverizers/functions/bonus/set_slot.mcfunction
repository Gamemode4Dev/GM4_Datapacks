#@s = pulverizers containing a recipe results
#Run from bonus/apply_bonus

function #pulverizers:set_bonus_id

scoreboard players operation @s gm4_stack_size = bonus_stack gm4_stack_size
execute if block ~ ~ ~ dropper{Items:[{Slot:7b}]} store result block ~ ~ ~ Items[0].Count byte 1 run scoreboard players get @s gm4_stack_size
