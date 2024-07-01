scoreboard objectives add gm4_df_time dummy
scoreboard objectives add gm4_entity_version dummy

execute unless score gm4_display_frames gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Display Frames"}
execute unless score gm4_display_frames gm4_earliest_version < gm4_display_frames gm4_modules run scoreboard players operation gm4_display_frames gm4_earliest_version = gm4_display_frames gm4_modules
scoreboard players set gm4_display_frames gm4_modules 1

schedule function gm4_display_frames:main 1t



#$moduleUpdateList
