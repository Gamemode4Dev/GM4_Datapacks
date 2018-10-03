execute as @e[type=item] store result score @s gm4_age run data get entity @s Age
execute as @e[type=item,scores={gm4_age=5400..5799}] at @s run particle dust 1.000 1.000 0.000 1 ~ ~0.5 ~ 0.1 0.1 0.1 0.1 5 normal
execute as @e[type=item,scores={gm4_age=5800..5949}] at @s run particle dust 1.000 0.000 0.000 1 ~ ~0.5 ~ 0.1 0.1 0.1 0.1 5 normal
execute as @e[type=item,scores={gm4_age=5940..}] at @s run particle dust 0.000 0.000 0.000 1 ~ ~0.5 ~ 0.1 0.1 0.1 0.1 5 normal