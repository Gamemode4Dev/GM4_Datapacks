execute as @e[type=#gm4_display_frames:frame,tag=gm4_df_invis_frame] at @s if entity @a[gamemode=!spectator,distance=..8,limit=1] run function gm4_display_frames:frame/invisible/process

# kill lazy loaded AECs
execute as @e[type=area_effect_cloud,tag=gm4_df_potion_tracker] run function gm4_display_frames:thrown_potion_tracking/kill

schedule function gm4_display_frames:main 16t
