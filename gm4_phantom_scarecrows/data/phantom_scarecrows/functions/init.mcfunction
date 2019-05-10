#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Phantom Scarecrows...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.phantom_scarecrows"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Phantom Scarecrows...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set phantom_scarecrows gm4_modules 1
scoreboard players set phantom_scarecrows gm4_clock_tick 0
scoreboard objectives add gm4_ps_time dummy
scoreboard players set modulo gm4_ps_time 3

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Phantom Scarecrows Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.phantom_scarecrows"}]}]}]
execute unless entity @a[limit=1] run say GM4: Phantom Scarecrows Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
