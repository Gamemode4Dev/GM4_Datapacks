# @s = player who joined for the first time
# run from advancement gm4_teleportation_anchors:join

execute store result score @s gm4_ta_id run data get entity @s UUID[3]
