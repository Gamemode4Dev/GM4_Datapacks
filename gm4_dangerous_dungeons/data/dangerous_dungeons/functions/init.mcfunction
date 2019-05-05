#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Dangerous Dungeons..."}]
execute unless entity @p run say GM4: Installing Dangerous Dungeons...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set dangerous_dungeons gm4_modules 1
scoreboard players set dangerous_dungeons gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Dangerous Dungeons Installed!"}]
execute unless entity @p run say GM4: Dangerous Dungeons Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
