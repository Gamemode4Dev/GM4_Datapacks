# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from pose/track/update

# move armor_stand in front of player
execute if score @s gm4_bas_move matches 1 run tp @s ^ ^ ^1
execute if score @s gm4_bas_move matches 2 run tp @s ^ ^ ^2
execute if score @s gm4_bas_move matches 3 run tp @s ^ ^ ^3
execute if score @s gm4_bas_move matches 4 run tp @s ^ ^ ^4

# round up position to multiples of 1/16th of a block
execute if entity @p[tag=gm4_bas_track,predicate=gm4_better_armour_stands:sneaking] run function gm4_better_armour_stands:pose/snap/position
