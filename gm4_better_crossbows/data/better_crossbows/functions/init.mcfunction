#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Better Crossbows..."}]
execute unless entity @p run say GM4: Installing Better Crossbows...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set better_crossbows gm4_modules 1
scoreboard players set better_crossbows gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Better Crossbows Installed!"}]
execute unless entity @p run say GM4: Better Crossbows Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
