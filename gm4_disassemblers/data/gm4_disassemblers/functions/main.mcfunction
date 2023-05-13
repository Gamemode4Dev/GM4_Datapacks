# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_disassembler] at @s run function gm4_disassemblers:upgrade_machine_stand
# process machine
execute as @e[type=marker,tag=gm4_disassembler] at @s if block ~ ~ ~ dropper[triggered=false] run function gm4_disassemblers:process

schedule function gm4_disassemblers:main 16t
