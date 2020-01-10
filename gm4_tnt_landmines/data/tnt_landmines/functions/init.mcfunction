#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing TNT Landmines...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.tnt_landmines"}]}]}]
execute unless entity @p run say GM4: Installing TNT Landmines...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set tnt_landmines gm4_modules 1
scoreboard players set tnt_landmines gm4_clock_tick 0

scoreboard objectives add gm4_tnt_cals dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["TNT Landmines Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.tnt_landmines"}]}]}]
execute unless entity @p run say GM4: TNT Landmines Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
