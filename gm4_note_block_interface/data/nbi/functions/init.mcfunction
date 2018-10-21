#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Note Block Interface..."}]
execute unless entity @p run say GM4: Installing Note Block Interface...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set nbi gm4_modules 1
scoreboard players set nbi gm4_clockTick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Note Block Interface Installed!"}]
execute unless entity @p run say GM4: Note Block Interface Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}

#scoreboards
scoreboard objectives add gm4_nbi_punch minecraft.custom:minecraft.play_noteblock
scoreboard objectives add gm4_nbi_click minecraft.custom:minecraft.tune_noteblock
scoreboard objectives add gm4_nbi_ray dummy
scoreboard objectives add gm4_nbi_change dummy