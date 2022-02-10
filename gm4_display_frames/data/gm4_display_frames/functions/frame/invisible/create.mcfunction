# checks for item frames once the splash potion of invisibility has despawned
# @s = potion tracker AEC
# run from thrown_potion_tracking/check_splash

tag @e[type=item_frame,distance=..2] add gm4_df_invis_frame
tag @e[type=glow_item_frame,distance=..2] add gm4_df_invis_frame
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:display_frames
