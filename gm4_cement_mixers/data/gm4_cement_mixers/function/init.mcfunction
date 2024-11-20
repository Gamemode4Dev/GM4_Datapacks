execute unless score cement_mixers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cement Mixers"}
execute unless score cement_mixers gm4_earliest_version < cement_mixers gm4_modules run scoreboard players operation cement_mixers gm4_earliest_version = cement_mixers gm4_modules
scoreboard players set cement_mixers gm4_modules 1



#$moduleUpdateList
