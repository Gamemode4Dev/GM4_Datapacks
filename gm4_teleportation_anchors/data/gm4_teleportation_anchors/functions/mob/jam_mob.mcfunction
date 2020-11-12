# @s = endermen and shulkers that are jammed
# run from main

execute as @e[type=#gm4_teleportation_anchors:teleporters,tag=gm4_ta_jammed] at @s run function gm4_teleportation_anchors:mob/check_movement_type
