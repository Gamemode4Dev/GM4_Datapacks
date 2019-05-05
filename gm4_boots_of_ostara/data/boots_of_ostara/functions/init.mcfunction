#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Boots of Ostara..."}]
execute unless entity @p run say GM4: Installing Boots of Ostara...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set boots_of_ostara gm4_modules 1
scoreboard players set boots_of_ostara gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Boots of Ostara Installed!"}]
execute unless entity @p run say GM4: Boots of Ostara Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
