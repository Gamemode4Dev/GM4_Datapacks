#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Private Lockers...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.private_lockers"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Private Lockers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set private_lockers gm4_modules 1
scoreboard players set private_lockers gm4_clock_tick 0

scoreboard objectives add gm4_locked dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Private Lockers Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.private_lockers"}]}]}]
execute unless entity @a[limit=1] run say GM4: Private Lockers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
