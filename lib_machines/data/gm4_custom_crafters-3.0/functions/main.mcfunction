# runs every 16 ticks
# @s = none
# located at world spawn
# run from gm4_custom_crafters-3.0:load

# NOTE remove during 1.20 update: updates old custom crafters to include a marker entity
execute as @e[type=armor_stand,tag=gm4_custom_crafter,name="gm4_custom_crafter"] at @s run function gm4_custom_crafters-3.0:upgrade_machine_stand
# process custom crafters
execute as @e[type=marker,tag=gm4_custom_crafter] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function gm4_custom_crafters-3.0:process

schedule function gm4_custom_crafters-3.0:main 16t
