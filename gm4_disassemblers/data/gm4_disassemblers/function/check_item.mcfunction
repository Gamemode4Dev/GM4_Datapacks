# processes each item
# @s = armor stand display (we need the hand) [tag=gm4_disassembler_stand]
# located at the disassembler block
# run from extract
data modify entity @s equipment.mainhand set from storage gm4_disassemblers:temp Items[0]
execute store result score $damage gm4_disassembler run data get storage gm4_disassemblers:temp Items[0].components."minecraft:damage"
scoreboard players set $dropped gm4_disassembler 0
function #gm4_disassemblers:before_base
execute if score $dropped gm4_disassembler matches 0 run function #gm4_disassemblers:during_base
execute if score $dropped gm4_disassembler matches 0 run function #gm4_disassemblers:after_base
