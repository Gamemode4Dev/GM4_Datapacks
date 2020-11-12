# @s = endermen and shulkers near a teleporation jammer
# run from main

# check if entity is in a minecart or boat
tag @s add gm4_ta_selected
execute as @e[type=#gm4_teleportation_anchors:vehicles,distance=..1] if data entity @s Passengers[0] run function gm4_teleportation_anchors:mob/track_movement/check_passengers
tag @s remove gm4_ta_selected

execute unless entity @s[tag=gm4_ta_ignore] run function gm4_teleportation_anchors:mob/check_pos
scoreboard players reset @s[tag=gm4_ta_ignore] gm4_ta_pos_x
scoreboard players reset @s[tag=gm4_ta_ignore] gm4_ta_pos_y
scoreboard players reset @s[tag=gm4_ta_ignore] gm4_ta_pos_z

tag @s remove gm4_ta_ignore
