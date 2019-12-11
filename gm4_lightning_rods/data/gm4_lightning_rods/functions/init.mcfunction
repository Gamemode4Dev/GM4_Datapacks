execute unless score lightning_rods gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lightning Rods"}
scoreboard players set lightning_rods gm4_modules 1

schedule function lightning_rods:main 1t

#$moduleUpdateList
