# @s = player placing an armor_stand
# at @s
# run from advancement place

advancement revoke @a only gm4_better_armour_stands:place

execute positioned ^ ^ ^2 as @e[type=armor_stand,tag=,distance=..2] run function gm4_better_armour_stands:new
