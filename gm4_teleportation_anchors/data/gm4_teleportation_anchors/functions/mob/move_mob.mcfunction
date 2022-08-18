# jammed enderman or shulker that teleported
# run from mob/check_pos

execute store result entity @s Pos[0] double 0.01 run scoreboard players get @s gm4_ta_pos_x
execute store result entity @s Pos[1] double 0.01 run scoreboard players get @s gm4_ta_pos_y
execute store result entity @s Pos[2] double 0.01 run scoreboard players get @s gm4_ta_pos_z

scoreboard players set @s[type=enderman] gm4_ta_jam_time 3

# teleportation anchors
tag @s add gm4_ta_new_tp
execute at @s as @e[type=marker,tag=gm4_ta_wired,distance=..129] if score @s gm4_ta_jam_id = @e[limit=1,tag=gm4_ta_new_tp] gm4_ta_jam_id at @s run function gm4_teleportation_anchors:blocks/anchor/search
execute at @s as @e[type=marker,tag=gm4_ta_found_anchor] if score @s gm4_ta_jam_id = @e[limit=1,tag=gm4_ta_new_tp] gm4_ta_jam_id run tag @s add gm4_ta_anchor_loc

execute at @e[type=marker,tag=gm4_ta_anchor_loc,limit=1] positioned ~ ~1 ~ run function gm4_teleportation_anchors:mob/anchor_tp

kill @e[type=marker,tag=gm4_ta_anchor_loc]
tag @s remove gm4_ta_new_tp

# visuals
execute at @s[tag=!gm4_ta_anchor_tp] run function gm4_teleportation_anchors:mob/visuals_jam

tag @s remove gm4_ta_anchor_tp
