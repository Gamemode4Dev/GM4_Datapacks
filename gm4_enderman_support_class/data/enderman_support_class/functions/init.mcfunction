#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Enderman Support Class...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.enderman_support_class"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Enderman Support Class...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set enderman_support_class gm4_modules 1
scoreboard players set enderman_support_class gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Enderman Support Class Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.enderman_support_class"}]}]}]
execute unless entity @a[limit=1] run say GM4: Enderman Support Class Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
