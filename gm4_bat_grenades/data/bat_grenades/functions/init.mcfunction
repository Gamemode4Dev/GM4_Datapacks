#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Bat Grenades...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.bat_grenades"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Bat Grenades...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set bat_grenades gm4_modules 1
scoreboard players set bat_grenades gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Bat Grenades Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.bat_grenades"}]}]}]
execute unless entity @a[limit=1] run say GM4: Bat Grenades Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
