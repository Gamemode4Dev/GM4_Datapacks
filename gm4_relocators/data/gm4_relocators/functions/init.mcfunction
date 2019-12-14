scoreboard objectives add gm4_rl_data dummy

execute unless score relocators gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Relocators"}
scoreboard players set relocators gm4_modules 1

#$moduleUpdateList
