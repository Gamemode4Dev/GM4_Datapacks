# check for thrown splash/lingering potions of invisibility
execute as @e[type=potion,predicate=gm4_display_frames:invisibility_potion] at @s run function gm4_display_frames:thrown_potion_tracking/spawn_tracker

# kill lazy loaded markers
execute as @e[type=marker,tag=gm4_df_potion_tracker] run function gm4_display_frames:thrown_potion_tracking/kill

schedule function gm4_display_frames:tick 1t
