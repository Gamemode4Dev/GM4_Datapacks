#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Cooler Caves...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.cooler_caves"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Cooler Caves...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set cooler_caves gm4_modules 1
scoreboard players set cooler_caves gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Cooler Caves Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.cooler_caves"}]}]}]
execute unless entity @a[limit=1] run say GM4: Cooler Caves Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
