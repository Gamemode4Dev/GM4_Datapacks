#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Efficient Track Laying...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.efficient_track_laying"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Efficient Track Laying...
#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set efficient_track_laying gm4_modules 1
scoreboard players set efficient_track_laying gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Efficient Track Laying Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.efficient_track_laying"}]}]}]
execute unless entity @a[limit=1] run say GM4: Efficient Track Laying Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
