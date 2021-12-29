# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from pose/track/update

# move armor_stand in front of player
execute if score @s gm4_bas_move_y matches 1 positioned ~ ~-.25 ~ run function gm4_better_armour_stands:pose/track/move_tp
execute if score @s gm4_bas_move_y matches 2 positioned ~ ~-.75 ~ run function gm4_better_armour_stands:pose/track/move_tp
execute if score @s gm4_bas_move_y matches 3 positioned ~ ~-1.25 ~ run function gm4_better_armour_stands:pose/track/move_tp
execute if score @s gm4_bas_move_y matches 4 positioned ~ ~-1.75 ~ run function gm4_better_armour_stands:pose/track/move_tp

# round up position to multiples of 1/16th of a block
execute if entity @p[tag=gm4_bas_track,predicate=gm4_better_armour_stands:sneaking] run function gm4_better_armour_stands:pose/snap/position
