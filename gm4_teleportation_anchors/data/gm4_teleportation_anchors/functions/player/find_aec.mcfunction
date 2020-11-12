# @s = player who just ate chorus fruit
# run from player/move_player

scoreboard players operation current gm4_ta_id = @s gm4_ta_id
execute as @e[type=area_effect_cloud,tag=gm4_ta_player_pos] if score @s gm4_ta_id = current gm4_ta_id run tag @s add gm4_ta_selected_player_pos
execute at @e[type=area_effect_cloud,tag=gm4_ta_selected_player_pos,limit=1,sort=nearest] run tp @s ~ ~ ~

execute at @s as @e[type=area_effect_cloud,tag=gm4_ta_selected_player_pos,limit=1,sort=nearest] if entity @s[tag=gm4_ta_at_anchor] run tag @p[tag=gm4_ta_teleported,distance=..0.001] add gm4_ta_anchor_tp
execute at @s[tag=gm4_ta_anchor_tp] run function gm4_teleportation_anchors:player/visuals_anchor
execute at @s[tag=!gm4_ta_anchor_tp] run function gm4_teleportation_anchors:player/visuals_jam

kill @e[type=area_effect_cloud,tag=gm4_ta_selected_player_pos]
tag @s remove gm4_ta_teleported
tag @s remove gm4_ta_anchor_tp
