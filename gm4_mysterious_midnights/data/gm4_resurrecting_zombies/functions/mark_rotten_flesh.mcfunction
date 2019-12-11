#@s = rotten_flesh item on the ground
#at world spawn
#called by event

scoreboard players add @s gm4_rezombify 1
execute at @s run particle minecraft:entity_effect ~ ~ ~ .33 .11 .29 1 0
