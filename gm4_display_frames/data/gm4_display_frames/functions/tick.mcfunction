# check for thrown splash/lingering potions of invisibility
execute as @e[type=potion,predicate=gm4_display_frames:invisibility_potion] at @s run function gm4_display_frames:spawn_aec
execute if score potion_present gm4_df_data matches 1 at @e[type=area_effect_cloud,tag=gm4_df_potion_tracker] unless entity @e[tag=gm4_df_potion_tracker,distance=.001..1] if entity @e[type=item_frame,tag=!gm4_df_invis_frame,distance=..2] run function gm4_display_frames:create

schedule function gm4_display_frames:tick 1t
