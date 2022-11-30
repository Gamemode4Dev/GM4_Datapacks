# checks for a single item in the dropper
# @s = disassembler marker [tag=gm4_disassembler]
# located at the dissasembler block
# run from main

data modify storage gm4_disassemblers:temp Items set from block ~ ~ ~ Items
execute if data storage gm4_disassemblers:temp Items[0] unless data storage gm4_disassemblers:temp Items[1] positioned ~ ~-0.4 ~ as @e[type=armor_stand,tag=gm4_disassembler_stand,limit=1,distance=..0.01] positioned ~ ~0.4 ~ run function gm4_disassemblers:check_item
