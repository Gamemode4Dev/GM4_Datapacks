#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Towers Structures...",{"translate":"text.gm4.modules.update.installing","with":["Towers Structures"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Towers Structures...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set tower_structures gm4_modules 1
scoreboard players set tower_structures gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Towers Structures Installed!",{"translate":"text.gm4.modules.update.installed","with":["Towers Structures"]}]}]
execute unless entity @a[limit=1] run say GM4: Towers Structures Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
