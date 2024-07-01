execute unless score washing_tanks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Washing Tanks"}
execute unless score washing_tanks gm4_earliest_version < washing_tanks gm4_modules run scoreboard players operation washing_tanks gm4_earliest_version = washing_tanks gm4_modules
scoreboard players set washing_tanks gm4_modules 1



#$moduleUpdateList
