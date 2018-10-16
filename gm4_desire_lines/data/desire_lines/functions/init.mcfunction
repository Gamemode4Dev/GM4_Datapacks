#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Desire Lines..."}]
execute unless entity @p run say GM4: Installing Desire Lines...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set desire_lines gm4_modules 1
scoreboard players set desire_lines gm4_clockTick 0

scoreboard objectives add gm4_dl_random dummy
scoreboard objectives add gm4_desire_lines minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add gm4_dl_sprint minecraft.custom:minecraft.sprint_one_cm

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Desire Lines Installed!"}]
execute unless entity @p run say GM4: Desire Lines Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
