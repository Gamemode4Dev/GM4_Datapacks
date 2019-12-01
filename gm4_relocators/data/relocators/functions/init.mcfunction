#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Relocators...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.relocators"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Relocators...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set relocators gm4_modules 1

scoreboard objectives add gm4_rl_data dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Relocators Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.relocators"}]}]}]
execute unless entity @a[limit=1] run say GM4: Relocators Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
