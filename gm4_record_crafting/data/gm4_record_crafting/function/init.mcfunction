execute unless score record_crafting gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Record Crafting"}
execute unless score record_crafting gm4_earliest_version < record_crafting gm4_modules run scoreboard players operation record_crafting gm4_earliest_version = record_crafting gm4_modules
scoreboard players set record_crafting gm4_modules 1



#$moduleUpdateList
