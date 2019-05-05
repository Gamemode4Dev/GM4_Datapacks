#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Potion Liquids..."}]
execute unless entity @p run say GM4: Installing Potion Liquids...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set potion_liquids gm4_modules 1
#scoreboard players set potion_liquids gm4_clock_tick 0   ##Module Run by Liquid Tanks Base

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Potion Liquids Installed!"}]
execute unless entity @p run say GM4: Potion Liquids Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
