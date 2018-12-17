#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Dirty Food..."}]
execute unless entity @p run say GM4: Installing Dirty Food...

#declare and initialise scoreboards and settings
scoreboard objectives add gm4_df_clock dummy "GM4 Dirty Food Clock"

scoreboard players set update_happened gm4_up_check 1
scoreboard players set dirty_food gm4_modules 1
scoreboard players set dirty_food gm4_clock_tick 0
#the next score is the number of clock ticks, not normal ticks, before the checks run
scoreboard players set check_tick gm4_df_clock 20

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Dirty Food Installed!"}]
execute unless entity @p run say GM4: Dirty Food Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
