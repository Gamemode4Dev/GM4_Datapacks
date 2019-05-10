#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Mysterious Midnights...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.mysterious_midnights"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Mysterious Midnights...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set mysterious_midnights gm4_modules 1
scoreboard players set mysterious_midnights gm4_clock_tick 0

scoreboard objectives add gm4_nights_data dummy
scoreboard players set 8 gm4_nights_data 8
scoreboard players set 16 gm4_nights_data 16
scoreboard players set 17 gm4_nights_data 17
scoreboard players set moon_phase gm4_nights_data -1
scoreboard players set send_night_end_pulse gm4_nights_data 0

scoreboard objectives add gm4_tipped_type dummy

scoreboard objectives add gm4_rezombify dummy
scoreboard objectives add gm4_reskelify dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Mysterious Midnights Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.mysterious_midnights"}]}]}]
execute unless entity @a[limit=1] run say GM4: Mysterious Midnights Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
