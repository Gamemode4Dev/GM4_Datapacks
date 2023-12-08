scoreboard objectives add gm4_gold_sword minecraft.used:minecraft.golden_sword

execute unless score potion_swords gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Potion Swords"}
execute unless score potion_swords gm4_earliest_version < potion_swords gm4_modules run scoreboard players operation potion_swords gm4_earliest_version = potion_swords gm4_modules
scoreboard players set potion_swords gm4_modules 1

schedule function gm4_potion_swords:tick 1t



#$moduleUpdateList
