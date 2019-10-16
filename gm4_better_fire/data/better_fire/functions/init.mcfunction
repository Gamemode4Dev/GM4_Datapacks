scoreboard objectives add gm4_creep_health dummy

scoreboard players set better_fire gm4_modules 1

execute unless score better_fire gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Better Fire"}

schedule function better_fire:main 1t

#$moduleUpdateList
