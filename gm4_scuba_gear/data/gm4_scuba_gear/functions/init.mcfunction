scoreboard objectives add gm4_sg_swim minecraft.custom:minecraft.swim_one_cm

execute unless score scuba_gear gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Scuba Gear"}
scoreboard players set scuba_gear gm4_modules 1

schedule function gm4_scuba_gear:main 1t

#$moduleUpdateList
