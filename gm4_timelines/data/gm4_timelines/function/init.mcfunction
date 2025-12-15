execute unless score timelines gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Timelines"}
execute unless score timelines gm4_earliest_version < timelines gm4_modules run scoreboard players operation timelines gm4_earliest_version = timelines gm4_modules
scoreboard players set timelines gm4_modules 1

scoreboard objectives add gm4_timelines.data dummy

scoreboard players set #24000 gm4_timelines.data 24000

gamerule advance_weather false

function gm4_timelines:register/days

schedule function gm4_timelines:main 1t

#$moduleUpdateList
