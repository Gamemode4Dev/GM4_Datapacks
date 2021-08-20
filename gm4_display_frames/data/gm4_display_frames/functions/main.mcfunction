execute as @e[type=item_frame,tag=gm4_df_invis_frame] at @s if entity @a[gamemode=!spectator,distance=..8,limit=1] run function gm4_display_frames:frame/invisible/process

execute as @e[type=glow_item_frame,tag=gm4_df_invis_frame] at @s if entity @a[gamemode=!spectator,distance=..8,limit=1] run function gm4_display_frames:frame/invisible/process

schedule function gm4_display_frames:main 16t
