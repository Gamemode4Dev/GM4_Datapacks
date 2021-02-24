# @s = display frame within 16 blocks of a player
# run from main

execute if entity @s[tag=gm4_df_invisible,nbt=!{Item:{}}] run function gm4_display_frames:clear_invis
execute if entity @s[tag=!gm4_df_invisible,nbt={Item:{}}] run function gm4_display_frames:apply_invis
execute if entity @s[tag=!gm4_df_invisible,nbt=!{Item:{}}] at @s run particle entity_effect ^ ^ ^.2 0.8 0.8 0.8 0.6 0
