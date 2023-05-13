# @s = invisibility potion that landed
# run from potion_tracking/verify_landed_potion

execute if entity @e[type=item_frame,tag=!smithed.entity,tag=!gm4_df_invis_frame,distance=..2.5,limit=1] run function gm4_display_frames:frame/invisible/create
execute if entity @e[type=glow_item_frame,tag=!smithed.entity,tag=!gm4_df_invis_frame,distance=..2.5,limit=1] run function gm4_display_frames:frame/invisible/create
