#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Blast Furnaces..."}]
execute unless entity @p run say GM4: Installing Blast Furnaces...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set blast_furnaces gm4_modules 1
scoreboard players set blast_furnaces gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Blast Furnaces Installed!"}]
execute unless entity @p run say GM4: Blast Furnaces Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
