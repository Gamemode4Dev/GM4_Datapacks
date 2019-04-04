#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Cooler Caves..."}]
execute unless entity @p run say GM4: Installing Cooler Caves...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set cooler_caves gm4_modules 1
scoreboard players set cooler_caves gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Cooler Caves Installed!"}]
execute unless entity @p run say GM4: Cooler Caves Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
