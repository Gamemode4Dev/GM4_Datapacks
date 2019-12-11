execute unless score MODULE_ID gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"MODULE_NAME"}
scoreboard players set MODULE_ID gm4_modules 1

schedule function gm4_MODULE_ID:main 10t

#$moduleUpdateList
