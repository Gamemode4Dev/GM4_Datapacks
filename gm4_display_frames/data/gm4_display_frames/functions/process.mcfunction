# @s = display frame within 16 blocks of a player
# run from main

data merge entity @s[tag=!gm4_df_invisible,nbt={Item:{}}] {Invisible:1b,Glowing:0b,Tags:["gm4_df_invis_frame","gm4_df_invisible","gm4_df_processed"]}
data merge entity @s[tag=!gm4_df_processed,tag=gm4_df_invisible,nbt=!{Item:{}}] {Invisible:0b,Glowing:1b,Tags:["gm4_df_invis_frame","gm4_df_processed","gm4_df_glowing"]}

data merge entity @s[tag=!gm4_df_processed,tag=!gm4_df_invisible,tag=!gm4_df_glowing,distance=..8] {Glowing:1b,Tags:["gm4_df_invis_frame","gm4_df_processed","gm4_df_glowing"]}
data merge entity @s[tag=!gm4_df_processed,tag=!gm4_df_invisible,tag=gm4_df_glowing,distance=8..] {Glowing:0b,Tags:["gm4_df_invis_frame","gm4_df_processed"]}

tag @s remove gm4_df_processed
