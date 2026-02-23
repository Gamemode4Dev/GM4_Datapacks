# checks for a single item in the dropper
# @s = disassembler marker [tag=gm4_disassembler]
# located at the dissasembler block
# run from main

data modify storage gm4_disassemblers:temp Items set from block ~ ~ ~ Items
execute if data storage gm4_disassemblers:temp Items[0] unless data storage gm4_disassemblers:temp Items[1] as 344d47-4-4-4-f04ce104d run function gm4_disassemblers:check_item
