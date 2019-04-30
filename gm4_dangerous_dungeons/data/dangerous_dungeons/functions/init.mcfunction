#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Dangerous Dungeons...",{"translate":"text.gm4.modules.update.installing","with":["Dangerous Dungeons"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Dangerous Dungeons...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set dangerous_dungeons gm4_modules 1
scoreboard players set dangerous_dungeons gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Dangerous Dungeons Installed!",{"translate":"text.gm4.modules.update.installed","with":["Dangerous Dungeons"]}]}]
execute unless entity @a[limit=1] run say GM4: Dangerous Dungeons Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
