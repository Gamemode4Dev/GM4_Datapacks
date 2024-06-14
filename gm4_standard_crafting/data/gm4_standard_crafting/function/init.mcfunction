execute unless score standard_crafting gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Standard Crafting"}
execute unless score standard_crafting gm4_earliest_version < standard_crafting gm4_modules run scoreboard players operation standard_crafting gm4_earliest_version = standard_crafting gm4_modules
scoreboard players set standard_crafting gm4_modules 1



#$moduleUpdateList
