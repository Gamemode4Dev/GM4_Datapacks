#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Sharpening Tools..."}]
execute unless entity @p run say GM4: Installing Sharpening Tools...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set sharpening_tools gm4_modules 1
scoreboard players set sharpening_tools gm4_clock_tick 0

scoreboard objectives add gm4_st_damage dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Sharpening Tools Installed!"}]
execute unless entity @p run say GM4: Sharpening Tools Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
