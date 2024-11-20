scoreboard objectives add gm4_count dummy

execute unless score cozy_campfires gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cozy Campfires"}
execute unless score cozy_campfires gm4_earliest_version < cozy_campfires gm4_modules run scoreboard players operation cozy_campfires gm4_earliest_version = cozy_campfires gm4_modules
scoreboard players set cozy_campfires gm4_modules 1

schedule function gm4_cozy_campfires:main 10t



#$moduleUpdateList
