# runs every 16 ticks
# @s = none
# located at world spawn
# run from gm4_custom_crafters:load

# NOTE remove during 1.20 update: updates old custom crafters to include a marker entity
execute as @e[type=armor_stand,tag=gm4_custom_crafter,name="gm4_custom_crafter"] at @s run function gm4_custom_crafters:upgrade_machine_stand
# process custom crafters
execute as @e[type=marker,tag=gm4_custom_crafter] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function gm4_custom_crafters:process

schedule function gm4_custom_crafters:main 16t
