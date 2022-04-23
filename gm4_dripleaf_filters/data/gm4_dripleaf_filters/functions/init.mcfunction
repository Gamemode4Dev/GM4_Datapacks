execute unless score dripleaf_filters gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Dripleaf Filters"}
scoreboard players set dripleaf_filters gm4_modules 1

scoreboard objectives add gm4_dripleaf_filters dummy

schedule function gm4_dripleaf_filters:main 1t

#$moduleUpdateList
