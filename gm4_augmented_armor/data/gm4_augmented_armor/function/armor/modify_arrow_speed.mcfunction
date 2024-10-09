
# alter motion with reduction
execute store result score $mot_x gm4_aa_data run data get entity @s Motion[0] 1000
execute store result score $mot_y gm4_aa_data run data get entity @s Motion[1] 1000
execute store result score $mot_z gm4_aa_data run data get entity @s Motion[2] 1000

scoreboard players operation $mot_x_change gm4_aa_data = $mot_x gm4_aa_data
scoreboard players operation $mot_y_change gm4_aa_data = $mot_y gm4_aa_data
scoreboard players operation $mot_z_change gm4_aa_data = $mot_z gm4_aa_data
scoreboard players operation $mot_x_change gm4_aa_data *= $motion_reduction gm4_aa_data
scoreboard players operation $mot_y_change gm4_aa_data *= $motion_reduction gm4_aa_data
scoreboard players operation $mot_z_change gm4_aa_data *= $motion_reduction gm4_aa_data
scoreboard players operation $mot_x_change gm4_aa_data /= #100 gm4_aa_data
scoreboard players operation $mot_y_change gm4_aa_data /= #100 gm4_aa_data
scoreboard players operation $mot_z_change gm4_aa_data /= #100 gm4_aa_data
scoreboard players operation $mot_x gm4_aa_data += $mot_x_change gm4_aa_data
scoreboard players operation $mot_y gm4_aa_data += $mot_y_change gm4_aa_data
scoreboard players operation $mot_z gm4_aa_data += $mot_z_change gm4_aa_data

execute store result entity @s Motion[0] double 0.001 run scoreboard players get $mot_x gm4_aa_data
execute store result entity @s Motion[1] double 0.001 run scoreboard players get $mot_y gm4_aa_data
execute store result entity @s Motion[2] double 0.001 run scoreboard players get $mot_z gm4_aa_data
