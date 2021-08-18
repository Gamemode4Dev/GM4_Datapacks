# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from pose/track/update

execute if score @s gm4_bas_move matches 1 run tp @s ^ ^ ^1
execute if score @s gm4_bas_move matches 2 run tp @s ^ ^ ^2
execute if score @s gm4_bas_move matches 3 run tp @s ^ ^ ^3
execute if score @s gm4_bas_move matches 4 run tp @s ^ ^ ^4
