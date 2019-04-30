#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Better Armour Stands...",{"translate":"text.gm4.modules.update.installing","with":["Better Armour Stands"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Better Armour Stands...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set better_armour_stands gm4_modules 1
scoreboard players set better_armour_stands gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Better Armour Stands Installed!",{"translate":"text.gm4.modules.update.installed","with":["Better Armour Stands"]}]}]
execute unless entity @a[limit=1] run say GM4: Better Armour Stands Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
