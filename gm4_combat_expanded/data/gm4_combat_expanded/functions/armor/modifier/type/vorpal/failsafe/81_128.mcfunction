# @s = vorpal marker
# at @s
# run from armor/type/vorpal/33_128

execute if score $y_pos gm4_ce_data matches ..96 run spreadplayers ~ ~ 0 8 under 96 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 96..112 run spreadplayers ~ ~ 0 8 under 112 false @e[type=marker,tag=gm4_ce_vorpal]
execute if score $y_pos gm4_ce_data matches 113.. run spreadplayers ~ ~ 0 8 under 128 false @e[type=marker,tag=gm4_ce_vorpal]
