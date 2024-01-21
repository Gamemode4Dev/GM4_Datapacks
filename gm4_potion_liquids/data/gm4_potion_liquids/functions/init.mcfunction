execute unless score potion_liquids gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Potion Liquids"}
execute unless score potion_liquids gm4_earliest_version < potion_liquids gm4_modules run scoreboard players operation potion_liquids gm4_earliest_version = potion_liquids gm4_modules
scoreboard players set potion_liquids gm4_modules 1



#$moduleUpdateList
