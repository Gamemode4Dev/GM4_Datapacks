scoreboard players set lightning_rods gm4_modules 1

execute unless score lightning_rods gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lightning Rods"}

schedule function lightning_rods:main 1t

#$moduleUpdateList
