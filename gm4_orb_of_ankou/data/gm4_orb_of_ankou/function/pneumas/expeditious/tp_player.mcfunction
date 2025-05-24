# @s = player with expeditious pneuma who stopped sneaking
# located at a safe block, random distance from player
# run from pneumas/expeditious/set_ypos

# prevent reroll
scoreboard players set set_y gm4_pneuma_data 11
scoreboard players set expeditious_attempt gm4_pneuma_data 12

# move player
execute at @s run playsound minecraft:item.chorus_fruit.teleport player @a[distance=..15] ~ ~ ~ 1 1
execute at @s run particle minecraft:explosion ~ ~.3 ~ .3 .4 .3 2 0
tp @s ~ ~ ~
particle minecraft:portal ~ ~.2 ~ 0 -1 0 3 20

# compatibility with other modules
function #gm4_orb_of_ankou:pneumas/expeditious/tp_player
