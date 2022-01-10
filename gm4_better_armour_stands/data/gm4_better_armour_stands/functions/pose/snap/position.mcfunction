# @s = armor_stand being moved
# at @s
# run from pose/track/move

# round to nearest 1/8th of a block
execute store result storage gm4_better_armour_stands:temp Pos[0] double .125 run scoreboard players operation $as_pos_x gm4_bas_data /= #125 gm4_bas_data
execute store result storage gm4_better_armour_stands:temp Pos[1] double .125 run scoreboard players operation $as_pos_y gm4_bas_data /= #125 gm4_bas_data
execute store result storage gm4_better_armour_stands:temp Pos[2] double .125 run scoreboard players operation $as_pos_z gm4_bas_data /= #125 gm4_bas_data
