#@s = roaming bees
#at world spawn
#run from main

scoreboard players add @s gm4_bee_data 1

execute if score @s gm4_bee_data matches 64.. run data merge entity @s {DeathTime:19,Health:0}
