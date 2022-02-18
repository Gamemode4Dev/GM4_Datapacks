# player that interacted with the "right click detection" wandering trader while holding rope ladder
# @s =  player holding rope ladder (having right clicked on ladder)
# at @s
# run from advancement gm4_rope_ladders:rcd_ladder

advancement revoke @s only gm4_rope_ladders:rcd_ladder

function gm4_rope_ladders:ladder_placement/raycast/init
