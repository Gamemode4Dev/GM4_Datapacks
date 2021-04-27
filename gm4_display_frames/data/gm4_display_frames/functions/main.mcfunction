execute as @e[type=#gm4_display_frames:frame,tag=gm4_df_invis_frame] at @s if entity @a[gamemode=!spectator,distance=..8,limit=1] run function gm4_display_frames:frame/invisible/process

# kill lazy loaded AECs
scoreboard players add @e[type=area_effect_cloud,tag=gm4_df_potion_tracker] gm4_df_time 1
kill @e[type=area_effect_cloud,tag=gm4_df_potion_tracker,scores={gm4_df_time=2..}]

schedule function gm4_display_frames:main 16t
