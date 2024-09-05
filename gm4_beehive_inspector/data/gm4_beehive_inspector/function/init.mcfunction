scoreboard objectives add gm4_beehive_insp dummy

execute unless score beehive_inspector gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Beehive Inspector"}
execute unless score beehive_inspector gm4_earliest_version < beehive_inspector gm4_modules run scoreboard players operation beehive_inspector gm4_earliest_version = beehive_inspector gm4_modules
scoreboard players set beehive_inspector gm4_modules 1

#$moduleUpdateList
