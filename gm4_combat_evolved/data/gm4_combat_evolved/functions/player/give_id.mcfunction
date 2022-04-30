# give every player a unique id
# @s = new player
# run from advancement give_id

scoreboard players add $next gm4_ce_id 1
scoreboard players operation @s gm4_ce_id = $next gm4_ce_id
