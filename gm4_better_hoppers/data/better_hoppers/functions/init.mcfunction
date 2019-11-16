#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Better Hoppers...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.better_hoppers"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Better Hoppers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set better_hoppers gm4_modules 1
scoreboard players set better_hoppers gm4_clock_tick 0
scoreboard objectives add gm4_bh_data dummy
scoreboard players set #0 gm4_bh_data 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Better Hoppers Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.better_hoppers"}]}]}]
execute unless entity @a[limit=1] run say GM4: Better Hoppers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
