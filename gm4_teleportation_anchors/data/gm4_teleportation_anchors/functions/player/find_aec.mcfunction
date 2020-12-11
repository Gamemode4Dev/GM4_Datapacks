# @s = player to be teleported back to their location or to an anchor
# run from player/move_player

scoreboard players operation current gm4_ta_id = @s gm4_ta_id
execute as @e[type=area_effect_cloud,tag=gm4_ta_player_pos] if score @s gm4_ta_id = current gm4_ta_id run tag @s add gm4_ta_selected_player_pos
execute at @e[type=area_effect_cloud,tag=gm4_ta_selected_player_pos,limit=1,sort=nearest] run tp @s ~ ~ ~

execute at @s[tag=gm4_ta_anchor_tp,scores={gm4_ta_jam_pl=18}] run function gm4_teleportation_anchors:player/visuals_anchor
execute at @s[tag=!gm4_ta_anchor_tp,scores={gm4_ta_jam_pl=18}] run function gm4_teleportation_anchors:player/visuals_jam

tag @e[type=area_effect_cloud,tag=gm4_ta_player_pos] remove gm4_ta_selected_player_pos

tag @s[scores={gm4_ta_jam_pl=..0}] remove gm4_ta_teleported
tag @s[scores={gm4_ta_jam_pl=..0}] remove gm4_ta_anchor_tp
