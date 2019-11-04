#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Chestpack...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.chestpack"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Chestpack...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set chestpack gm4_modules 1
scoreboard players set chestpack gm4_clock_tick 0

scoreboard objectives add gm4_chestpack dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Chestpack Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.chestpack"}]}]}]
execute unless entity @a[limit=1] run say GM4: Chestpack Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
