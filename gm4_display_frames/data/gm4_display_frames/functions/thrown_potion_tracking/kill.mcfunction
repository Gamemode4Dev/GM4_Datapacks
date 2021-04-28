# force-kills tracker AECs in case they are in lazy loaded chunks
# @s = gm4_df_potion_tracker AEC
# at world spawn
# run from main

scoreboard players add @s gm4_df_time 1
kill @s[scores={gm4_df_time=2..}]
