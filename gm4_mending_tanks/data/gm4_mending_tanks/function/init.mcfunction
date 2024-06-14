scoreboard objectives add gm4_lt_util dummy
scoreboard players set #mt_repair_per_xp gm4_lt_util 2
scoreboard players set #mt_max_repair gm4_lt_util 32

execute unless score mending_tanks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mending Tanks"}
execute unless score mending_tanks gm4_earliest_version < mending_tanks gm4_modules run scoreboard players operation mending_tanks gm4_earliest_version = mending_tanks gm4_modules
scoreboard players set mending_tanks gm4_modules 1



#$moduleUpdateList
