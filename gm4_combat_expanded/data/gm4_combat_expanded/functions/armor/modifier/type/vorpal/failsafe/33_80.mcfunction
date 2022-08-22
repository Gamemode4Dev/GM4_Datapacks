# @s = vorpal marker
# at @s
# run from armor/type/vorpal/33_128

execute if score $y_pos gm4_ce_data matches ..48 run spreadplayers ~ ~ 0 8 under 48 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 49..64 run spreadplayers ~ ~ 0 8 under 64 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 65.. run spreadplayers ~ ~ 0 8 under 80 false @e[type=marker,tag=gm4_ce_vorpal]
