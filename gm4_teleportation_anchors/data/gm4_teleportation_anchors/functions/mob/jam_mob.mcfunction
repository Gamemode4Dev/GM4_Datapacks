# @s = none
# run from main

scoreboard players remove @e[type=#gm4_teleportation_anchors:teleporters,scores={gm4_ta_ignore=1..}] gm4_ta_ignore 1
execute as @e[type=#gm4_teleportation_anchors:teleporters,scores={gm4_ta_ignore=1..}] run tag @s add gm4_ta_ignore
execute as @e[type=#gm4_teleportation_anchors:teleporters,scores={gm4_ta_ignore=-1}] run tag @s add gm4_ta_ignore

execute as @e[type=#gm4_teleportation_anchors:teleporters,tag=gm4_ta_jammed] at @s run function gm4_teleportation_anchors:mob/check_movement_type
