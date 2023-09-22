# spawns a baby interaction that handles right click detection
# @s = player holding ladder
# at position of ladder block, align xyz positioned ~.5 ~ ~.5 (varies based on rotation)
# run from function: gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/found

# spawn rcd
summon interaction ~0.0 ~0.0 ~0.0 {Glowing:1b,width:0.2f,height:1.05f,response:1b,Tags:["gm4_rol_rcd","gm4_rol_rcd_ladder","smithed.entity","smithed.strict"]}

# start loop
function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/loop
