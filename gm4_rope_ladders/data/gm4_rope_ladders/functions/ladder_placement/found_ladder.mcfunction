# begins scan of vertical column below the ladder
# @s = player holding rope ladder (having right clicked on ladder)
# position of ladder
# run from gm4_rope_ladders:ladder_placement/raycast/ray

scoreboard players set $ray gm4_rol_data -999

function gm4_rope_ladders:ladder_placement/scan_column/init
