# @s = player who joined for the first time
# run from advancement "set_id"

execute store result score @s gm4_sf_id run data get entity @s UUID[0]
scoreboard players set @s gm4_sf_fragments 0
