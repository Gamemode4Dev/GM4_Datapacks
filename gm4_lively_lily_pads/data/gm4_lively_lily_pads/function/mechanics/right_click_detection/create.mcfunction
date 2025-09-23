# Sets up rcd
# @s = new interaction
# at @s
# run from mechanics/right_click_detection/found

data merge entity @s {width:0.4f,height:0.3f,response:1b,Tags:["gm4_llp_placement_rcd","smithed.entity","smithed.strict"]}
scoreboard players operation @s gm4_llp.id = $player gm4_llp.id
