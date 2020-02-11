# @s = custom crafters with valid recipe format inside
# run from #gm4_custom_crafters:recipe_check

execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
