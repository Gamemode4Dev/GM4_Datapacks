execute unless score timelines gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Timelines"}
execute unless score timelines gm4_earliest_version < timelines gm4_modules run scoreboard players operation timelines gm4_earliest_version = timelines gm4_modules
scoreboard players set timelines gm4_modules 1

scoreboard objectives add gm4_timelines.data dummy

scoreboard players set #8 gm4_timelines.data 8
scoreboard players set #24000 gm4_timelines.data 24000

gamerule advance_weather false

function gm4_timelines:register/days
execute store result score #day.offset gm4_timelines.data run data get storage gm4_timelines:data day_data.offset
execute store result score #day.duration gm4_timelines.data run data get storage gm4_timelines:data day_data.duration

# TODO: only run this when needed, it resets everything to day 0
function gm4_timelines:reset

schedule function gm4_timelines:main 1t

#$moduleUpdateList
