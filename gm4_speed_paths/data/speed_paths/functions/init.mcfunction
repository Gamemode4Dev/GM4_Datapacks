#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Speed Paths...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.speed_paths"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Speed Paths...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set speed_paths gm4_modules 1
scoreboard players set speed_paths gm4_clock_tick 0
scoreboard players set speed_paths_2 gm4_clock_tick 8

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Speed Paths Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.speed_paths"}]}]}]
execute unless entity @a[limit=1] run say GM4: Speed Paths Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
