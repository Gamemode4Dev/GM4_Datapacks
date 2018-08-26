#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Potion Swords..."}]
execute unless entity @p run say GM4: Installing Potion Swords...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set potion_swords gm4_modules 1
scoreboard players set potion_swords gm4_clockTick 0
scoreboard objectives add gm4_gold_sword minecraft.used:minecraft.golden_sword

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Potion Swords Installed!"}]
execute unless entity @p run say GM4: Potion Swords Installed!

#check other modules to make sure they're up to date.
execute if score potion_swords gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Potion Swords\"",Tags:["updateMessage"],Duration:2000}
execute if score potion_swords gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
