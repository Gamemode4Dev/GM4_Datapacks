
advancement revoke @s only gm4_rope_ladders:rcd_ladder

scoreboard players set $rope_ladder_placed gm4_rol_data 0

function gm4_rope_ladders:ladder_placement/raycast/init

execute if score $rope_ladder_placed gm4_rol_data matches 1 run item modify entity @s weapon.mainhand gm4_rope_ladders:minus_one
