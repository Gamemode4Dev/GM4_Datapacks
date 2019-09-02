#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Blast Furnaces...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.blast_furnaces"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Blast Furnaces...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set blast_furnaces gm4_modules 1
scoreboard players set blast_furnaces gm4_clock_tick 0

scoreboard objectives add gm4_bf_data dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Blast Furnaces Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.blast_furnaces"}]}]}]
execute unless entity @a[limit=1] run say GM4: Blast Furnaces Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
