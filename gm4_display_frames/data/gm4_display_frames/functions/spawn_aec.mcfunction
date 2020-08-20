# tracks thrown splash potions of invisibility with a line of aec's
# @s = Splash/Lingering Potion of Invisibility
# run from tick

summon minecraft:area_effect_cloud ^ ^ ^.03 {Duration:2,Tags:["gm4_df_potion_tracker"]}
scoreboard players set potion_present gm4_df_data 1
tag @s add gm4_df_potion_tracker
