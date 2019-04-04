#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Weighted Armour..."}]
execute unless entity @p run say GM4: Installing Weighted Armour...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set weighted_armour gm4_modules 1
scoreboard players set weighted_armour gm4_clock_tick 0

scoreboard objectives add gm4_armor armor

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Weighted Armour Installed!"}]
execute unless entity @p run say GM4: Weighted Armour Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
