execute unless score timelines gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Timelines"}
execute unless score timelines gm4_earliest_version < timelines gm4_modules run scoreboard players operation timelines gm4_earliest_version = timelines gm4_modules
scoreboard players set timelines gm4_modules 1

schedule function gm4_timelines:main 1t



#$moduleUpdateList
