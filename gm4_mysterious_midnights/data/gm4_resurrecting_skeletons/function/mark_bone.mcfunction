#@s = bone item on the ground
#at world spawn
#called by event

scoreboard players add @s gm4_reskelify 1
execute at @s run particle minecraft:entity_effect{color:[0.33,0.11,0.29,1.0]} ~ ~ ~ 0 0 0 1 0
