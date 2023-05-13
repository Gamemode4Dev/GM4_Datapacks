# @s = vorpal marker
# at @s
# run from armor/type/vorpal/-64_32

execute if score $y_pos gm4_ce_data matches ..-48 run spreadplayers ~ ~ 0 8 under -48 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches -49..-32 run spreadplayers ~ ~ 0 8 under -32 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches -33.. run spreadplayers ~ ~ 0 8 under -16 false @e[type=marker,tag=gm4_ce_vorpal]
