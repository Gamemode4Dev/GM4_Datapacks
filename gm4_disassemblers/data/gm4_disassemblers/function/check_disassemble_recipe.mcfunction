# processes each item
# @s = force load chunk armor stand (we need the hand)
# located at the disassembler block
# run from gm4_disassemblers:check_item (#gm4_disassemblers:during_base)

# generated loot table
execute if score $dropped gm4_disassembler matches 0 store result score $dropped gm4_disassembler run loot replace block ~ ~ ~ container.0 fish gm4_disassemblers:caller ~ ~ ~ mainhand
