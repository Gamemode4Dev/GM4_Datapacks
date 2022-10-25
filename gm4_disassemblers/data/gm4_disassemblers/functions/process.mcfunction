
data modify storage gm4_disassemblers:temp Items set from block ~ ~ ~ Items

execute if data storage gm4_disassemblers:temp Items[0] unless data storage gm4_disassemblers:temp Items[1] run function #gm4_disassemblers:check_recipe
