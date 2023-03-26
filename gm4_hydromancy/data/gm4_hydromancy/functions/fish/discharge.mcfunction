# send charge from this fish to a nearby coral flower
# @s = tropical fish with full charge
# at @s
# run from clock_tracked_fish

execute as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=gm4_hy_coral_vine.flowering,limit=1,sort=nearest] at @s run function gm4_hydromancy:coral_vine/flower/charge
scoreboard players add @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=gm4_hy_coral_vine.flowering,limit=1,sort=nearest] gm4_hy_charge 1

tag @s remove gm4_hy_charged_fish
function gm4_hydromancy:fish/update_color

particle block red_concrete ~ ~ ~ 0.15 0.15 0.15 0.05 5
