# give every player a unique id
# @s = new player
# at world spawn
# run from advancement give_id

execute store result score @s gm4_ce_id run scoreboard players add $next gm4_ce_id 1
