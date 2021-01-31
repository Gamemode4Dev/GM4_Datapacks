execute as @e[type=#gm4_display_frames:frame,tag=gm4_df_invis_frame] at @s if entity @a[gamemode=!spectator,distance=..16,limit=1] run function gm4_display_frames:process

schedule function gm4_display_frames:main 16t
