#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Enchantment Extractors..."}]
execute unless entity @p run say GM4: Installing Enchantment Extractors...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set enchantment_extractors gm4_modules 1
scoreboard players set enchantment_extractors gm4_clockTick 0

scoreboard objectives add gm4_random dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Enchantment Extractors Installed!"}]
execute unless entity @p run say GM4: Enchantment Extractors Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
