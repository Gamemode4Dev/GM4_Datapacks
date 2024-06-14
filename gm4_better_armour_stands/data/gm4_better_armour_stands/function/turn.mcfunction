# @s = armor_stand
# at @s
# run from tick

execute if score @s gm4_bas_turn matches 1 run tp @s ~ ~ ~ ~-1 ~
execute if score @s gm4_bas_turn matches 2 run tp @s ~ ~ ~ ~1 ~
