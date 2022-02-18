# player that interacted with the "right click detection" wandering trader while holding rope ladder
# @s =  player holding rope ladder (having right clicked on ladder)
# at @s
# run from gm4_rope_ladders:ladder_placement/interact_rcd

scoreboard players set $ray gm4_rol_data 0 
execute anchored eyes run function gm4_rope_ladders:ladder_placement/raycast/ray

