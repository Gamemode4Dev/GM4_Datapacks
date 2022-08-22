# @s = players with synergetic pneuma
# run from main

# check if nearby wolves are owned by the player
execute as @e[type=wolf,tag=!smithed.entity,distance=..4] if data entity @s Owner run function gm4_orb_of_ankou:pneumas/synergetic/check_wolf
effect give @e[type=wolf,distance=..4,scores={gm4_pneuma_data=0}] strength 5 0
scoreboard players reset @e[type=wolf,distance=..4] gm4_pneuma_data

# apply strength to other synergetic players
effect give @a[gamemode=!spectator,distance=0.1..8,tag=gm4_pneuma_synergetic] strength 5 0
