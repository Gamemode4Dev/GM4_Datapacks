scoreboard objectives add gm4_df_time dummy
scoreboard objectives add gm4_entity_version dummy

execute unless score gm4_display_frames gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Display Frames"}
scoreboard players set gm4_display_frames gm4_modules 1

schedule function gm4_display_frames:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 897.733109399926 ~ {CustomName:'"gm4_display_frames_guide"',Tags:["gm4_guide"],data:{type:"module",id:"display_frames",page_count:1,line_count:1,module_name:"Display Frames"}}

#$moduleUpdateList
