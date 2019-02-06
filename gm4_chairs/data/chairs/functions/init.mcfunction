#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Chairs..."}]
execute unless entity @p run say GM4: Installing Chairs...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set chairs gm4_modules 1
scoreboard players set chairs gm4_clock_tick 0
team add gm4_chairs
team modify gm4_chairs collisionRule never

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Chairs Installed!"}]
execute unless entity @p run say GM4: Chairs Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
