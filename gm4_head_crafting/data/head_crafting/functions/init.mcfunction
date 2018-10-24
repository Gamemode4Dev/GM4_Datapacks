#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Record Crafting..."}]
execute unless entity @p run say GM4: Installing Record Crafting...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set head_crafting gm4_modules 1
scoreboard players set head_crafting gm4_clockTick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Record Crafting Installed!"}]
execute unless entity @p run say GM4: Record Crafting Installed!

#check other modules to make sure they're up to date.
execute if score some_module gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Some Module\"",Tags:["updateMessage"],Duration:2000}
execute if score some_other_module gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
