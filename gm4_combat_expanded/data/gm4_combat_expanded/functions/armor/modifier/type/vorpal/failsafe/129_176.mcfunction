# @s = vorpal marker
# at @s
# run from armor/type/vorpal/129_224

execute if score $y_pos gm4_ce_data matches ..144 run spreadplayers ~ ~ 0 8 under 144 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 145..160 run spreadplayers ~ ~ 0 8 under 160 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 161.. run spreadplayers ~ ~ 0 8 under 176 false @e[type=marker,tag=gm4_ce_vorpal]
