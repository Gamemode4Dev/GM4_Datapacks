# @s = endermen and shulkers near a teleporation jammer
# run from mob/jam_mob

# check if entity is in a minecart or boat
tag @s[predicate=gm4_teleportation_anchors:in_vehicle] add gm4_ta_ignore

execute unless entity @s[tag=gm4_ta_ignore] run function gm4_teleportation_anchors:mob/check_pos
scoreboard players reset @s[tag=gm4_ta_ignore] gm4_ta_pos_x
scoreboard players reset @s[tag=gm4_ta_ignore] gm4_ta_pos_y
scoreboard players reset @s[tag=gm4_ta_ignore] gm4_ta_pos_z

tag @s remove gm4_ta_ignore
