execute unless score speed_paths gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Speed Paths"}
scoreboard players set speed_paths gm4_modules 1

schedule function speed_paths:main 1t

#$moduleUpdateList
