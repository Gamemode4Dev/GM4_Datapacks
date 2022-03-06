# @s = player holding ladder
# at @s
# run from function: gm4_rope_ladders:player/as

# tag
tag @s add gm4_rol_holding_ladder
tag @s remove gm4_rol_sees_ladder

# check for ladder
function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/init
