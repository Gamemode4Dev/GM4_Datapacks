scoreboard objectives add gm4_creep_health dummy

execute unless score better_fire gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Better Fire"}
scoreboard players set better_fire gm4_modules 1

schedule function gm4_better_fire:main 1t

#$moduleUpdateList
