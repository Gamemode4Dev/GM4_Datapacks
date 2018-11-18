#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Bat Grenades..."}]
execute unless entity @p run say GM4: Installing Bat Grenades...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set bat_grenades gm4_modules 1
scoreboard players set bat_grenades gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Bat Grenades Installed!"}]
execute unless entity @p run say GM4: Bat Grenades Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
