# Called from pulse_check
execute as @e[type=armor_stand,tag=gm4_disassembler] at @s run function gm4_disassemblers:update

schedule function gm4_disassemblers:main 16t
