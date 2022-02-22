# run from advancement give_id
# @s = new player

scoreboard players add $next gm4_ai_id 1
scoreboard players operation @s gm4_ai_id = $next gm4_ai_id
