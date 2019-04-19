#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Mob Conversion..."}]
execute unless entity @p run say GM4: Installing Mob Conversion...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set mob_conversion gm4_modules 1
scoreboard players set mob_conversion gm4_clock_tick 0
scoreboard objectives add gm4_mob_con_data dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Mob Conversion Installed!"}]
execute unless entity @p run say GM4: Mob Conversion Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
