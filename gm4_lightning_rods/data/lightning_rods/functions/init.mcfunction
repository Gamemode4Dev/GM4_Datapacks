#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Lightning Rods..."}]
execute unless entity @p run say GM4: Installing Lightning Rods...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set lightning_rods gm4_modules 1
scoreboard players set lightning_rods gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Lightning Rods Installed!"}]
execute unless entity @p run say GM4: Lightning Rods Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
