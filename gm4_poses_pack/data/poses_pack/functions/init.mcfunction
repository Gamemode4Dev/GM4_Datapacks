#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Poses Pack...",{"translate":"text.gm4.modules.update.installing","with":["Poses Pack"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Poses Pack...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set poses_pack gm4_modules 1

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Poses Pack Installed!",{"translate":"text.gm4.modules.update.installed","with":["Poses Pack"]}]}]
execute unless entity @a[limit=1] run say GM4: Poses Pack Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
