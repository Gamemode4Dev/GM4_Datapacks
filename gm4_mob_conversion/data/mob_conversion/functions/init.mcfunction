#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Mob Conversion...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.mob_conversion"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Mob Conversion...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set mob_conversion gm4_modules 1
scoreboard players set mob_conversion gm4_clock_tick 0
scoreboard objectives add gm4_mob_con_data dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Mob Conversion Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.mob_conversion"}]}]}]
execute unless entity @a[limit=1] run say GM4: Mob Conversion Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
