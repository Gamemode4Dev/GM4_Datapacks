# @s = new player
# at @s
# run from advancement join

scoreboard players add $next gm4_bas_id 1
scoreboard players operation @s gm4_bas_id = $next gm4_bas_id
