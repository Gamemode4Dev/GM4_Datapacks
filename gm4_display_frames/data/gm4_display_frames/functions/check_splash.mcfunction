# @s = none
# run from spawn_aec

execute at @e[type=area_effect_cloud,tag=gm4_df_potion_tracker] unless entity @e[tag=gm4_df_potion_tracker,distance=.001..1] if entity @e[type=item_frame,tag=!gm4_df_invis_frame,distance=..2] run function gm4_display_frames:create
