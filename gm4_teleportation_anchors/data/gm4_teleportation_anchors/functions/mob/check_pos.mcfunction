# @s = endermen and shulkers near a teleporation jammer
# run from mob/check_movement_type

execute unless score @s gm4_ta_pos_x = @s gm4_ta_pos_x run function gm4_teleportation_anchors:mob/track_movement/initialize_pos

function gm4_teleportation_anchors:mob/track_movement/check_dx
execute unless entity @s[tag=gm4_ta_teleported] run function gm4_teleportation_anchors:mob/track_movement/check_dz
execute unless entity @s[tag=gm4_ta_teleported] run function gm4_teleportation_anchors:mob/track_movement/check_dy
execute if entity @s[type=enderman,tag=!gm4_ta_teleported,tag=!gm4_ta_falling] run function gm4_teleportation_anchors:mob/track_movement/check_d

execute if entity @s[tag=gm4_ta_teleported] run function gm4_teleportation_anchors:mob/move_mob
execute if entity @s[tag=!gm4_ta_teleported] run function gm4_teleportation_anchors:mob/track_movement/update_pos

tag @s remove gm4_ta_teleported
tag @s remove gm4_ta_falling
