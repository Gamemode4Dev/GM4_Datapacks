# @s = jammed player who ate chorus fruit
# run from player/used_chorus

tag @s add gm4_ta_teleported
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_ta_new_player_pos","gm4_ta_player_pos"],Duration:3,Radius:0f,Particle:"block air"}
scoreboard players operation @e[type=area_effect_cloud,tag=gm4_ta_new_player_pos,distance=..0.01,limit=1,sort=nearest] gm4_ta_id = @p[distance=..0.001] gm4_ta_id

# move player to tp anchor if attached
tag @s add gm4_ta_new_tp
execute as @e[type=armor_stand,tag=gm4_ta_wired,distance=..65] if score @s gm4_ta_jam_id = @a[limit=1,tag=gm4_ta_new_tp] gm4_ta_jam_id at @s run function gm4_teleportation_anchors:blocks/find_anchor
execute as @e[type=area_effect_cloud,tag=gm4_ta_found_anchor] if score @s gm4_ta_jam_id = @a[limit=1,tag=gm4_ta_new_tp] gm4_ta_jam_id run tag @s add gm4_ta_anchor_loc
execute if entity @e[type=area_effect_cloud,tag=gm4_ta_anchor_loc,limit=1] run tag @e[type=area_effect_cloud,tag=gm4_ta_new_player_pos,limit=1] add gm4_ta_at_anchor
execute at @e[type=area_effect_cloud,tag=gm4_ta_anchor_loc,limit=1] run tp @e[type=area_effect_cloud,tag=gm4_ta_at_anchor,limit=1] ~ ~1 ~
tag @s remove gm4_ta_new_tp

tag @e[type=area_effect_cloud,tag=gm4_ta_found_anchor] remove gm4_ta_anchor_loc
tag @e[type=area_effect_cloud] remove gm4_found_anchor
tag @e[type=area_effect_cloud,tag=gm4_ta_player_pos,distance=..0.001] remove gm4_ta_new_player_pos

schedule function gm4_teleportation_anchors:player/move_player 1t
