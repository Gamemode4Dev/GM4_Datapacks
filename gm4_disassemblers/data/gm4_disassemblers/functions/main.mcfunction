# Called from pulse_check
execute as @e[type=armor_stand,tag=gm4_disassembler] at @s run function disassemblers:update

schedule function disassemblers:main 16t
