execute unless score pig_tractors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Pig Tractors"}
execute unless score pig_tractors gm4_earliest_version < pig_tractors gm4_modules run scoreboard players operation pig_tractors gm4_earliest_version = pig_tractors gm4_modules
scoreboard players set pig_tractors gm4_modules 1

scoreboard objectives add gm4_pig_tractors dummy



#$moduleUpdateList
