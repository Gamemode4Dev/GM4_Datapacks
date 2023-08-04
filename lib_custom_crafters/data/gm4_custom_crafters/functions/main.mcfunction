# runs every 16 ticks
# @s = none
# located at world spawn
# run from gm4_custom_crafters:load

# process custom crafters
execute as @e[type=marker,tag=gm4_custom_crafter] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function gm4_custom_crafters:process

schedule function gm4_custom_crafters:main 16t
