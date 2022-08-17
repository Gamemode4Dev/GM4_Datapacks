# @s = teleportation jammer
# run from main

#execute unless block ~ ~ ~ dropper run function gm4_teleportation_anchors:blocks/jammer/destroy

tag @s remove gm4_ta_wired
execute if block ~ ~1 ~ end_rod[facing=up] run function gm4_teleportation_anchors:blocks/jammer/check_fuel

# store which TP Jammer is closest to the jammed mob
execute as @e[tag=gm4_ta_jammed] at @s run scoreboard players operation @s gm4_ta_jam_id = @e[type=marker,tag=gm4_teleportation_jammer,distance=..129,limit=1,sort=nearest] gm4_ta_jam_id
