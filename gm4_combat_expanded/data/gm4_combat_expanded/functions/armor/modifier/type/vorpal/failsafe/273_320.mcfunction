# @s = vorpal marker
# at @s
# run from armor/type/vorpal/225_320

execute if score $y_pos gm4_ce_data matches ..288 run spreadplayers ~ ~ 0 8 under 288 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 289..304 run spreadplayers ~ ~ 0 8 under 304 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 305.. run spreadplayers ~ ~ 0 8 false @e[type=marker,tag=gm4_ce_vorpal]
