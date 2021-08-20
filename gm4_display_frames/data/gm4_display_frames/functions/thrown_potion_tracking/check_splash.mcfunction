# @s = none
# scheduled from thrown_potion_tracking/spawn_tracker

execute at @e[type=marker,tag=gm4_df_potion_tracker] unless entity @e[type=#gm4_display_frames:potion_tracker,tag=gm4_df_potion_tracker,distance=.001..1,limit=1] if entity @e[type=item_frame,tag=!gm4_df_invis_frame,distance=..2.5,limit=1] run function gm4_display_frames:frame/invisible/create

execute at @e[type=marker,tag=gm4_df_potion_tracker] unless entity @e[type=#gm4_display_frames:potion_tracker,tag=gm4_df_potion_tracker,distance=.001..1,limit=1] if entity @e[type=glow_item_frame,tag=!gm4_df_invis_frame,distance=..2.5,limit=1] run function gm4_display_frames:frame/invisible/create

execute if entity @e[type=marker,tag=gm4_df_potion_tracker] run schedule function gm4_display_frames:thrown_potion_tracking/check_splash 1t
