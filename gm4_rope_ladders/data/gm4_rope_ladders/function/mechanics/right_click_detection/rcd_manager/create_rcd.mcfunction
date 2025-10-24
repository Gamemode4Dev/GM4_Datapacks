# sets up an interaction that handles right click detection
# @s = new interaction
# at position of ladder block, align xyz positioned ~.5 ~ ~.5 (varies based on rotation)
# run from function: gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/found

# init
data merge entity @s {width:0.2f,height:1.05f,response:1b,Tags:["gm4_rol_rcd_ladder","smithed.entity","smithed.strict"]}
scoreboard players operation @s gm4_rol_id = $player gm4_rol_id

# start loop
function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/loop
