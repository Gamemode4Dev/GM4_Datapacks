# @s = vorpal marker
# at @s
# run from armor/type/vorpal/129_224

execute if score $y_pos gm4_ce_data matches ..192 run spreadplayers ~ ~ 0 8 under 192 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 193..208 run spreadplayers ~ ~ 0 8 under 208 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches ..224 run spreadplayers ~ ~ 0 8 under 224 false @e[type=marker,tag=gm4_ce_vorpal]
