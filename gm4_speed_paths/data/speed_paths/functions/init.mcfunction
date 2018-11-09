#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Speed Paths..."}]
execute unless entity @p run say GM4: Installing Speed Paths...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set speed_paths gm4_modules 1
scoreboard players set speed_paths gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Speed Paths Installed!"}]
execute unless entity @p run say GM4: Speed Paths Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
