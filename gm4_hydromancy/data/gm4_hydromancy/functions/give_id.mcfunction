# give every player a unique id
# @s = new player
# at world spawn
# run from advancement give_id

execute store result score @s gm4_hy_id run scoreboard players add $next_id gm4_hy_id 1
