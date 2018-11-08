#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Shroomites..."}]
execute unless entity @p run say GM4: Installing Shroomites...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set shroomites gm4_modules 1
scoreboard players set shroomites gm4_clock_tick 0

scoreboard objectives add gm4_shroom_time dummy
scoreboard objectives add gm4_sporeprint dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Shroomites Installed!"}]
execute unless entity @p run say GM4: Shroomites Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
