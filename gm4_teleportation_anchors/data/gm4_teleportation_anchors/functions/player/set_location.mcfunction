# @s = player who used chorus 1 tick ago
# run from player/move_player

# find the AEC that belongs to the player (match IDs)
execute as @e[type=area_effect_cloud,tag=gm4_ta_player_pos] if score @s gm4_ta_id = @p[distance=..0.001,tag=gm4_ta_teleported] gm4_ta_id run tag @s add gm4_ta_selected_aec

# if the AEC is linked to a wired TP Jammer, then move the AEC
execute unless score @s gm4_ta_cooldown matches 1.. at @e[tag=gm4_ta_selected_aec,limit=1] as @e[type=armor_stand,tag=gm4_ta_wired,distance=..65] if score @s gm4_ta_jam_id = @e[tag=gm4_ta_selected_aec,limit=1,distance=..0.0001] gm4_ta_jam_id at @s run function gm4_teleportation_anchors:blocks/anchor/search
execute if score @e[type=area_effect_cloud,tag=gm4_ta_found_anchor,limit=1] gm4_ta_jam_id = @e[type=area_effect_cloud,tag=gm4_ta_selected_aec,limit=1] gm4_ta_jam_id at @e[type=area_effect_cloud,tag=gm4_ta_found_anchor,limit=1] run tp @e[type=area_effect_cloud,tag=gm4_ta_selected_aec,limit=1] ~ ~1 ~
execute if entity @e[type=area_effect_cloud,tag=gm4_ta_found_anchor,limit=1] run tag @e[type=area_effect_cloud,tag=gm4_ta_selected_aec,limit=1] add gm4_ta_anchored
execute if entity @e[type=area_effect_cloud,tag=gm4_ta_found_anchor,limit=1] run tag @s add gm4_ta_anchor_tp
scoreboard players set @s[tag=gm4_ta_anchor_tp] gm4_ta_cooldown 25

tag @e[type=area_effect_cloud] remove gm4_ta_found_anchor
tag @e[type=area_effect_cloud] remove gm4_ta_selected_aec
