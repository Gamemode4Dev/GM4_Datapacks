scoreboard objectives add gm4_sg_buoyancy dummy

execute unless score scuba_gear gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Scuba Gear"}
execute unless score scuba_gear gm4_earliest_version < scuba_gear gm4_modules run scoreboard players operation scuba_gear gm4_earliest_version = scuba_gear gm4_modules
scoreboard players set scuba_gear gm4_modules 1

#$moduleUpdateList
