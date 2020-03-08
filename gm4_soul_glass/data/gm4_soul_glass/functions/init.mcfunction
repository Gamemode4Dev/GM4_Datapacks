scoreboard objectives add gm4_sg_cook_time dummy
scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_sg_primary dummy
scoreboard objectives add gm4_sg_secondary dummy
scoreboard objectives add gm4_sg_levels dummy

execute unless score soul_glass gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Soul Glass"}
scoreboard players set soul_glass gm4_modules 1

schedule function gm4_soul_glass:main 1t
schedule function gm4_soul_glass:beacon_clock 1t

#$moduleUpdateList
