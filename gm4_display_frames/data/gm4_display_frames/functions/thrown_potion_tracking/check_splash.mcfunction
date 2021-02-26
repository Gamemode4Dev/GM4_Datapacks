# @s = none
# scheduled from spawn_aec

execute at @e[type=area_effect_cloud,tag=gm4_df_potion_tracker] unless entity @e[type=#gm4_display_frames:potion_tracker,tag=gm4_df_potion_tracker,distance=.001..1,limit=1] if entity @e[type=#gm4_display_frames:frame,tag=!gm4_df_invis_frame,distance=..2,limit=1] run function gm4_display_frames:frame/invisible/create
