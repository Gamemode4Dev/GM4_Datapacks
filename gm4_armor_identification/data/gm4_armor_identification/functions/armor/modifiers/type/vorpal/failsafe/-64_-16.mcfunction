# run from armor/active/vorpal/-64_32

execute if score $y_pos gm4_ai_data matches ..-48 run spreadplayers ~ ~ 0 8 under -48 false @e[type=marker,tag=gm4_ai_vorpal]
execute if score $y_pos gm4_ai_data matches -49..-32 run spreadplayers ~ ~ 0 8 under -32 false @e[type=marker,tag=gm4_ai_vorpal]
execute if score $y_pos gm4_ai_data matches -33.. run spreadplayers ~ ~ 0 8 under -16 false @e[type=marker,tag=gm4_ai_vorpal]
