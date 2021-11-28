# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_master_crafting] at @s run function gm4_master_crafters:upgrade_machine_stand
# process machine
execute as @e[type=marker,tag=gm4_master_crafter] at @s run function gm4_master_crafters:process

schedule function gm4_master_crafting:main 16t
