# @s = player with expeditious pneuma who stopped sneaking
# run from pneumas/expeditious/attempt

particle minecraft:explosion ~ ~.3 ~ .3 .4 .3 2 0
tp @s @e[type=marker,tag=gm4_oa_expeditious,limit=1]
playsound minecraft:item.chorus_fruit.teleport player @a[distance=..15] ~ ~ ~ 1 1
execute at @s run particle minecraft:portal ~ ~.2 ~ 0 -1 0 3 20

# compatibility with other modules
function #gm4_orb_of_ankou:pneumas/expeditious/tp_player
