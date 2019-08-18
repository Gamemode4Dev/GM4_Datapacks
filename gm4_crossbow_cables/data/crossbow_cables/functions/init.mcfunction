#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Crossbow Cables...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.crossbow_cables"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Crossbow Cables...
#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set crossbow_cables gm4_modules 1
scoreboard players set crossbow_cables gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Crossbow Cables Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.crossbow_cables"}]}]}]
execute unless entity @a[limit=1] run say GM4: Crossbow Cables Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
