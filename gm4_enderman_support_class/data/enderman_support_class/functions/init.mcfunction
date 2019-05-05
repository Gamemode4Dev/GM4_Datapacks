#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Enderman Support Class..."}]
execute unless entity @p run say GM4: Installing Enderman Support Class...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set enderman_support_class gm4_modules 1
scoreboard players set enderman_support_class gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Enderman Support Class Installed!"}]
execute unless entity @p run say GM4: Enderman Support Class Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
