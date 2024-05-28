# @s = display frame within 8 blocks of a player
# run from main

execute if items entity @s contents * run tag @s add gm4_df_has_item
execute if entity @s[tag=gm4_df_invisible,tag=!gm4_df_has_item] run function gm4_display_frames:frame/invisible/clear_invisibility
execute if entity @s[tag=!gm4_df_invisible,tag=gm4_df_has_item] run function gm4_display_frames:frame/invisible/apply_invisibility
execute if entity @s[tag=!gm4_df_invisible,tag=!gm4_df_has_item] at @s run particle minecraft:entity_effect{color:[0.8,0.8,0.8,0.6]} ^ ^ ^.2 0 0 0 0.6 0
tag @s remove gm4_df_has_item
