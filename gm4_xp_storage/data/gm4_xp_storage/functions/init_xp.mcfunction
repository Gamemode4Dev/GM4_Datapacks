# Set initial stored xp
# @s = new player
# at @s
# run from advancement join

execute unless score @s gm4_stored_xp matches 1.. run scoreboard players set @s gm4_stored_xp 0
