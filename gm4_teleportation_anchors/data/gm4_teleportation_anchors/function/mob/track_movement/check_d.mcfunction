# @s = endermen near a teleporation jammer
# run from mob/check_pos

# check total distance away from initial position
summon marker ~ ~ ~ {Tags:["gm4_ta_pos_tracker"]}
execute store result entity @e[type=marker,tag=gm4_ta_pos_tracker,limit=1] Pos[0] double 0.01 run scoreboard players get @s gm4_ta_pos_x
execute store result entity @e[type=marker,tag=gm4_ta_pos_tracker,limit=1] Pos[1] double 0.01 run scoreboard players get @s gm4_ta_pos_y
execute store result entity @e[type=marker,tag=gm4_ta_pos_tracker,limit=1] Pos[2] double 0.01 run scoreboard players get @s gm4_ta_pos_z

execute at @e[type=marker,tag=gm4_ta_pos_tracker,limit=1] run tag @s[distance=5.8..] add gm4_ta_teleported
execute if entity @s[tag=gm4_ta_teleported] at @e[type=marker,tag=gm4_ta_pos_tracker,limit=1] run tag @s[type=enderman,distance=5.8..7.2,predicate=gm4_teleportation_anchors:has_speed_1] remove gm4_ta_teleported
execute if entity @s[tag=gm4_ta_teleported] at @e[type=marker,tag=gm4_ta_pos_tracker,limit=1] run tag @s[type=enderman,distance=5.8..10.1,predicate=gm4_teleportation_anchors:has_speed_2] remove gm4_ta_teleported

kill @e[type=marker,tag=gm4_ta_pos_tracker,limit=1]
