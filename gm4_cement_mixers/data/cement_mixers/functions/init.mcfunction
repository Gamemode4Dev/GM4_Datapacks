#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Cement Mixers..."}]
execute unless entity @p run say GM4: Installing Cement Mixers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set cement_mixers gm4_modules 1
#scoreboard players set cement_mixers gm4_clock_tick 0   ##Module Run by Liquid Tanks Base

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Cement Mixers Installed!"}]
execute unless entity @p run say GM4: Cement Mixers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
