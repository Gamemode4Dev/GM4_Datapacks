# @s = slime_ball item on the ground
# at world spawn
# called by event

scoreboard players add @s gm4_reslimify 1
execute at @s run particle minecraft:entity_effect ~ ~ ~ 0 1 .1 1 0
