# @s = wither decorative particle
# run from soul_forge/process

teleport ^ ^ ^0.4
particle dust 0.071 0.000 0.161 1 ~ ~ ~ 0 0 0 .005 3
particle dust 0.475 0.639 0.443 1 ~ ~ ~ 0 0 0 .005 1
execute positioned ~ ~-1 ~ if entity @e[type=armor_stand,tag=gm4_soul_forge,distance=..3] run kill @s
scoreboard players add @s gm4_oa_marker 16
kill @s[scores={gm4_oa_marker=200..}]
