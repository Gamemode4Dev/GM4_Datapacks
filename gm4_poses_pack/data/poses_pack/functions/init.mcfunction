#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Poses Pack..."}]
execute unless entity @p run say GM4: Installing Poses Pack...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set poses_pack gm4_modules 1

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Poses Pack Installed!"}]
execute unless entity @p run say GM4: Poses Pack Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
