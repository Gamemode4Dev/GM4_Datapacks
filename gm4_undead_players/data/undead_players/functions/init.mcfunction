#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Undead Players..."}]
execute unless entity @p run say GM4: Installing Undead Players...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set undead_players gm4_modules 1
scoreboard players set undead_players gm4_clockTick 0
scoreboard objectives add gm4_undead minecraft.custom:minecraft.deaths

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Undead Players Installed!"}]
execute unless entity @p run say GM4: Undead Players Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
