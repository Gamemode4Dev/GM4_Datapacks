# give every player a unique id
# @s = new player
# at unspecified
# run from advancement give_id

execute store result score @s gm4_sr_id run scoreboard players add $next gm4_sr_id 1

# add a tier to this player
scoreboard players add @s gm4_sr_tier 0
