#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Boots of Ostara...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.boots_of_ostara"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Boots of Ostara...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set boots_of_ostara gm4_modules 1
scoreboard players set boots_of_ostara gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Boots of Ostara Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.boots_of_ostara"}]}]}]
execute unless entity @a[limit=1] run say GM4: Boots of Ostara Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
