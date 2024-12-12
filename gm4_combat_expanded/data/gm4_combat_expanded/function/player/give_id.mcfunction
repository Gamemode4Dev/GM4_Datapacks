# give every player a unique id
# @s = new player
# at unspecified
# run from advancement give_id

execute store result score @s gm4_ce_id run scoreboard players add $next gm4_ce_id 1

# set diff to 0 until the first diff calculation
scoreboard players add @s gm4_ce_difficult 0
