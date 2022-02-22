# run from armor/active/vorpal/-64_32

execute if score $y_pos gm4_ai_data matches ..0 run spreadplayers ~ ~ 0 8 under 0 false @e[type=marker,tag=gm4_ai_vorpal]
execute if score $y_pos gm4_ai_data matches 1..16 run spreadplayers ~ ~ 0 8 under 16 false @e[type=marker,tag=gm4_ai_vorpal]
execute if score $y_pos gm4_ai_data matches 17.. run spreadplayers ~ ~ 0 8 under 32 false @e[type=marker,tag=gm4_ai_vorpal]
