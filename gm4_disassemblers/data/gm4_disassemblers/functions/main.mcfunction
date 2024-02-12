# process machine
execute as @e[type=marker,tag=gm4_disassembler] at @s if block ~ ~ ~ dropper[triggered=false] run function gm4_disassemblers:process

schedule function gm4_disassemblers:main 16t
