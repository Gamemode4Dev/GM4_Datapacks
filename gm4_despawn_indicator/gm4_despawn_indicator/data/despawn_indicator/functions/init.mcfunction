#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Despawn Indicator..."}]
execute unless entity @p run say GM4: Installing Despawn Indicator...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set despawn_indicator gm4_modules 1
scoreboard players set despawn_indicator gm4_clockTick 0

scoreboard objectives add gm4_age dummy
scoreboard players set gm4_4800 gm4_age 4800

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Despawn Indicator Installed!"}]
execute unless entity @p run say GM4: Despawn Indicator Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
