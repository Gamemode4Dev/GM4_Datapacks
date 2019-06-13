#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Better Fire...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.better_fire"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Better Fire...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set better_fire gm4_modules 1
scoreboard players set better_fire gm4_clock_tick 0
scoreboard objectives add gm4_creep_health dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Better Fire Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.better_fire"}]}]}]
execute unless entity @a[limit=1] run say GM4: Better Fire Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
