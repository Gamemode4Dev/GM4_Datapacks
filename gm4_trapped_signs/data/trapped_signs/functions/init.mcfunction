#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Trapped Signs...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.trapped_signs"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Trapped Signs...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set trapped_signs gm4_modules 1
scoreboard players set trapped_signs gm4_clock_tick 0

scoreboard objectives add gm4_count dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Trapped Signs Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.trapped_signs"}]}]}]
execute unless entity @a[limit=1] run say GM4: Trapped Signs Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
