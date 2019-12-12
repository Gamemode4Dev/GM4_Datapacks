scoreboard objectives add gm4_tc_data dummy
scoreboard players set #9stack gm4_tc_data 9
scoreboard players set #4stack gm4_tc_data 4
scoreboard players set #64stack gm4_tc_data 64

execute unless score tinkering_compressors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Tinkering Compressors"}
scoreboard players set tinkering_compressors gm4_modules 1

schedule function gm4_tinkering_compressors:main 1t
schedule function gm4_tinkering_compressors:tick 1t

#$moduleUpdateList
