#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Cement Mixers...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.cement_mixers"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Cement Mixers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set cement_mixers gm4_modules 1
#scoreboard players set cement_mixers gm4_clock_tick 0   ##Module Run by Liquid Tanks Base

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Cement Mixers Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.cement_mixers"}]}]}]
execute unless entity @a[limit=1] run say GM4: Cement Mixers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
