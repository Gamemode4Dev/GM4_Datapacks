# @s = player hitting armor_stand
# at @s
# run from advancement invert

advancement revoke @a only gm4_better_armour_stands:invert

scoreboard players add @s gm4_bas_invert 1
execute unless score @s gm4_bas_invert matches 0..1 run scoreboard players set @s gm4_bas_invert 0
