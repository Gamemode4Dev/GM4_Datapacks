scoreboard objectives add gm4_gold_sword minecraft.used:minecraft.golden_sword

execute unless score potion_swords gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Potion Swords"}
scoreboard players set potion_swords gm4_modules 1

schedule function potion_swords:tick 1t

#$moduleUpdateList
