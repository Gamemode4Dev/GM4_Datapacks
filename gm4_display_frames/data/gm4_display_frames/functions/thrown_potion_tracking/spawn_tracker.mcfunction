# tracks thrown splash potions of invisibility with a line of aec's
# @s = Splash/Lingering Potion of Invisibility
# run from tick

summon minecraft:area_effect_cloud ^ ^ ^.03 {Duration:2,Tags:["gm4_df_potion_tracker"]}
tag @s add gm4_df_potion_tracker

schedule function gm4_display_frames:thrown_potion_tracking/check_splash 1t
