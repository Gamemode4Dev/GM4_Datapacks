#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Potion Infusers...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.potion_infusers"}]}]}]
execute unless entity @p run say GM4: Installing Potion Infusers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set potion_infusers gm4_modules 1
scoreboard players set potion_infusers gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Potion Infusers Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.potion_infusers"}]}]}]
execute unless entity @p run say GM4: Potion Infusers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
