# processes the jukebox
# @s = jukebox marker
# at @s
# run from main

execute unless block ~ ~ ~ jukebox{RecordItem:{Count:1b}} run kill @s
execute if score @s gm4_ar_time >= #max_play_time gm4_ar_time run kill @s

scoreboard players add @e[type=vex,tag=!smithed.entity,distance=..5] gm4_ar_time 1
execute at @e[type=vex,tag=!smithed.entity,distance=..5] run particle minecraft:note ~ ~ ~ 0 0.2 0 0.3 3
execute as @e[type=vex,scores={gm4_ar_time=30..},distance=..5] at @s run function gm4_allay_revitalizing:convert_vex
