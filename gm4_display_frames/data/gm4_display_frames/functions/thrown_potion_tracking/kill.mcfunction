# force-kills tracker markers in case they are in lazy loaded chunks
# @s = gm4_df_potion_tracker markers
# at world spawn
# run from main

scoreboard players add @s gm4_df_time 1
kill @s[scores={gm4_df_time=4..}]
