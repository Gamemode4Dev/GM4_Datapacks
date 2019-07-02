#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Chairs...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.chairs"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Chairs...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set chairs gm4_modules 1
scoreboard players set chairs gm4_clock_tick 0
team add gm4_chairs
team modify gm4_chairs collisionRule never
scoreboard objectives add gm4_chairs_sit dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Chairs Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.chairs"}]}]}]
execute unless entity @a[limit=1] run say GM4: Chairs Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
