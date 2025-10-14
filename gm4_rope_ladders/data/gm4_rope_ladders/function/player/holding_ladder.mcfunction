# @s = player holding ladder
# at @s
# run from function: gm4_rope_ladders:player/as

# tag
tag @s add gm4_rol_holding_ladder

# check for ladder
scoreboard players set $ray gm4_rol_data 0 
function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/ray
