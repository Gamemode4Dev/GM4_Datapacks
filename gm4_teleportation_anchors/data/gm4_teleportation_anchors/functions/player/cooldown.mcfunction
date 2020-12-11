# @s = player on Anchor cooldown
# run from main

particle minecraft:block chorus_plant ~ ~0.5 ~ 0 0 0 0 3 force
scoreboard players remove @s gm4_ta_cooldown 1
