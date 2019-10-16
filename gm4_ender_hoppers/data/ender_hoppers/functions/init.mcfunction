scoreboard players set ender_hoppers gm4_modules 1

execute unless score ender_hoppers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ender Hoppers"}

schedule function ender_hoppers:main 1t
schedule function ender_hoppers:tick 1t

#$moduleUpdateList
