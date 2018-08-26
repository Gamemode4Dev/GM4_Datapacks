#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Weighted Armour..."}]
execute unless entity @p run say GM4: Installing Weighted Armour...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set weighted_armour gm4_modules 1
scoreboard players set weighted_armour gm4_clockTick 0
scoreboard objectives add gm4_armor armor

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Weighted Armour Installed!"}]
execute unless entity @p run say GM4: Weighted Armour Installed!

#check other modules to make sure they're up to date.
execute if score other_module gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Weighted Armour\"",Tags:["updateMessage"],Duration:2000}
execute if score another_module gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
