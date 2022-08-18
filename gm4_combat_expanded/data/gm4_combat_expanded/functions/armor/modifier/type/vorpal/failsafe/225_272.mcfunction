# @s = vorpal marker
# at @s
# run from armor/type/vorpal/225_320

execute if score $y_pos gm4_ce_data matches ..240 run spreadplayers ~ ~ 0 8 under 240 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 241..256 run spreadplayers ~ ~ 0 8 under 256 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 257.. run spreadplayers ~ ~ 0 8 under 272 false @e[type=marker,tag=gm4_ce_vorpal]
