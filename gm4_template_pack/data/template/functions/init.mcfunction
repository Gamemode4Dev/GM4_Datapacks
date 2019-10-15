scoreboard players set MODULE_ID gm4_modules 1

execute unless score MODULE_ID gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"MODULE_NAME"}

schedule function MODULE_ID:main 10t

#$moduleUpdateList
