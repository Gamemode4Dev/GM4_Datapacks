# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_master_crafting] at @s run function gm4_forming_press:upgrade_machine_stand
# process machine
execute as @e[type=marker,tag=gm4_forming_press] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function gm4_forming_press:recipe_validity_check

schedule function gm4_forming_press:main 16t
