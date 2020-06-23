execute unless score endermen_deactivators gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Endermen Deactivators"}
scoreboard players set endermen_deactivators gm4_modules 1

scoreboard objectives add gm4_end_deact dummy
schedule function gm4_endermen_deactivators:main 10t

#$moduleUpdateList
