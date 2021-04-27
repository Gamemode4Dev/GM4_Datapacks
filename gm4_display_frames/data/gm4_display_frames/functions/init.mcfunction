scoreboard objectives add gm4_df_time dummy

execute unless score gm4_display_frames gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Display Frames"}
scoreboard players set gm4_display_frames gm4_modules 1

schedule function gm4_display_frames:main 1t
schedule function gm4_display_frames:tick 1t

#$moduleUpdateList
