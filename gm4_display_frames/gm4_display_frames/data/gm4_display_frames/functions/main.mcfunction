execute at @a[gamemode=!spectator] as @e[type=item_frame,tag=gm4_df_invis_frame,distance=..16] run function gm4_display_frames:process
schedule function gm4_display_frames:main 16t
