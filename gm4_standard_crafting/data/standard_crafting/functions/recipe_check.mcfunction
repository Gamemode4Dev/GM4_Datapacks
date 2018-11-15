#@s = custom crafters with valid recipe format inside

#recipes

# single: sandstones to sand
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..32 run function standard_crafting:single

# quadruple
execute if score @s gm4_slot_count matches 4 if score @s gm4_stack_size matches ..32 run function standard_crafting:quadruple

# sextuple
execute if score @s gm4_slot_count matches 6 if score @s gm4_stack_size matches 1 run function standard_crafting:sextuple

# nonuple, filled table
execute if score @s gm4_slot_count matches 9 if score @s gm4_stack_size matches ..64 run function standard_crafting:nonuple
