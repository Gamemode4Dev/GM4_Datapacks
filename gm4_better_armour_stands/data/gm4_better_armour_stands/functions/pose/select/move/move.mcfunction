# @s = armor_stand to be moved
# at @s
# run from pose/select

scoreboard players set @s gm4_bas_mode 7

scoreboard players reset @s gm4_bas_dist
scoreboard players reset @s gm4_bas_dx
scoreboard players reset @s gm4_bas_dy
scoreboard players reset @s gm4_bas_dz

execute at @a[tag=gm4_bas_active,limit=1] positioned ~ ~1.6 ~ positioned ^ ^ ^.5 run function gm4_better_armour_stands:pose/select/move/ray
