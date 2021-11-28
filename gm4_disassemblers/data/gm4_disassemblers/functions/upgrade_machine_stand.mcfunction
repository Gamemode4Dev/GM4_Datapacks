# updates old machine armor stands
# @s = disassembler armor stand
# located at @s
# run from gm4_disassemblers:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_disassembler","gm4_machine_marker","smithed.block"],CustomName:'"gm4_disassembler"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_disassembler_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_disassembler_stand"'}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Disassemble Gear",{"translate":"container.gm4.disassembler"}]}'}
