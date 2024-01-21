execute unless score speed_paths gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Speed Paths"}
execute unless score speed_paths gm4_earliest_version < speed_paths gm4_modules run scoreboard players operation speed_paths gm4_earliest_version = speed_paths gm4_modules
scoreboard players set speed_paths gm4_modules 1

scoreboard objectives add gm4_speed_paths dummy

schedule function gm4_speed_paths:main 1t



#$moduleUpdateList
