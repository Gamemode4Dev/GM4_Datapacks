scoreboard objectives add gm4_pul_data dummy

execute unless score pulverizers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Pulverizers"}
scoreboard players set pulverizers gm4_modules 1

schedule function gm4_pulverizers:main 1t
schedule function gm4_pulverizers:tick 1t

#$moduleUpdateList
