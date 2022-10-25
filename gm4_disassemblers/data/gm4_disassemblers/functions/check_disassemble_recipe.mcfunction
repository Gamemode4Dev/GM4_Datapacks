execute store result score $length gm4_disassembler run data get storage gm4_disassemblers:temp Items[0].id
execute store result score $damage gm4_disassembler run data get storage gm4_disassemblers:temp Items[0].tag.Damage

execute if score $length gm4_disassembler matches 13 run function gm4_disassemblers:disassembleables/13
execute if score $length gm4_disassembler matches 16 run function gm4_disassemblers:disassembleables/16
execute if score $length gm4_disassembler matches 18 run function gm4_disassemblers:disassembleables/18
execute if score $length gm4_disassembler matches 20 run function gm4_disassemblers:disassembleables/20
execute if score $length gm4_disassembler matches 21 run function gm4_disassemblers:disassembleables/21
execute if score $length gm4_disassembler matches 22 run function gm4_disassemblers:disassembleables/22
execute if score $length gm4_disassembler matches 23 run function gm4_disassemblers:disassembleables/23
execute if score $length gm4_disassembler matches 24 run function gm4_disassemblers:disassembleables/24
execute if score $length gm4_disassembler matches 25 run function gm4_disassemblers:disassembleables/25
execute if score $length gm4_disassembler matches 26 run function gm4_disassemblers:disassembleables/26
execute if score $length gm4_disassembler matches 27 run function gm4_disassemblers:disassembleables/27
execute if score $length gm4_disassembler matches 28 run function gm4_disassemblers:disassembleables/28
