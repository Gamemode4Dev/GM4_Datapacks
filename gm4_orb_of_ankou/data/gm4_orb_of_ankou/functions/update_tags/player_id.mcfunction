# gives a player a unique ID
# @s = player that joined for the first time
# located at @s
# run from advancement "check_player/get_id"

execute store result score @s gm4_oa_id run scoreboard players add #max gm4_oa_id 1
