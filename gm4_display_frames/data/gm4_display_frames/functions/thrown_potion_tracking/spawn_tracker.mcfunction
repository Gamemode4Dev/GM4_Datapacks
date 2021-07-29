# tracks thrown splash potions of invisibility with a line of markers
# @s = Splash/Lingering Potion of Invisibility
# run from tick

summon minecraft:marker ^ ^ ^.03 {Tags:["gm4_df_potion_tracker"]}
tag @s add gm4_df_potion_tracker

schedule function gm4_display_frames:thrown_potion_tracking/check_splash 1t
