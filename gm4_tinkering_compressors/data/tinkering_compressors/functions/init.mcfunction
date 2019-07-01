#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Block Compressors...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.block_compressors"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Tinkering Compressors...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set tinkering_compressors gm4_modules 1
scoreboard players set tinkering_compressors gm4_clock_tick 0

scoreboard objectives add gm4_tc_data dummy
scoreboard players set #9stack gm4_tc_data 9
scoreboard players set #4stack gm4_tc_data 4
scoreboard players set #64stack gm4_tc_data 64

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Block Compressors Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.block_compressors"}]}]}]
execute unless entity @a[limit=1] run say GM4: Tinkering Compressors Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
