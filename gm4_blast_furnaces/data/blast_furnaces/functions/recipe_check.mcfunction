#@s = custom crafters with valid recipe format inside

#recipes
#create blast furnace
execute if score @s gm4_slot_count matches 7 if score @s gm4_stack_size matches ..1 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:iron_bars"},{Slot:1b,id:"minecraft:iron_block"},{Slot:2b,id:"minecraft:iron_bars"},{Slot:4b,id:"minecraft:piston"},{Slot:6b,id:"minecraft:comparator"},{Slot:7b,id:"minecraft:redstone_torch"},{Slot:8b,id:"minecraft:comparator"}]} run function blast_furnaces:create
