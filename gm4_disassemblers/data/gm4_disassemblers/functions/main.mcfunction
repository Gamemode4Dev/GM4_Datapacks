# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_disassembler] at @s run function gm4_disassemblers:upgrade_machine_stand
# process machine
execute as @e[type=marker,tag=gm4_disassembler] at @s positioned ~-0.5 ~0.5 ~-0.5 as @e[type=item,tag=!gm4_disassemble,dx=0,nbt={OnGround:1b}] positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ dropper[triggered=false]{Items:[]} run function #gm4_disassemblers:check_recipe

schedule function gm4_disassemblers:main 16t
