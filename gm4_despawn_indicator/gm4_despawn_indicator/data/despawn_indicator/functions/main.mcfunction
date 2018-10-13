execute as @e[type=item] store result score @s gm4_age run data get entity @s Age
execute as @e[type=arrow] store result score @s gm4_age run data get entity @s life
scoreboard players operation @e[type=arrow] gm4_age += gm4_4800 gm4_age
execute at @e[scores={gm4_age=5700..5899}] run particle dust 1.000 1.000 0.000 1 ~ ~0.2 ~ 0.1 0.2 0.1 0.1 5 normal
execute at @e[scores={gm4_age=5900..}] run particle dust 1.000 0.000 0.000 1 ~ ~0.2 ~ 0.1 0.1 0.2 0.1 5 normal