execute unless score cooler_caves gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cooler Caves"}
execute unless score cooler_caves gm4_earliest_version < cooler_caves gm4_modules run scoreboard players operation cooler_caves gm4_earliest_version = cooler_caves gm4_modules
scoreboard players set cooler_caves gm4_modules 1



#$moduleUpdateList
