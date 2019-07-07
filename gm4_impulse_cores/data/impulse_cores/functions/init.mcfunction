#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Impulse Cores...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.impulse_cores"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Impulse Cores...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set impulse_cores gm4_modules 1
scoreboard players set impulse_cores gm4_clock_tick 0

scoreboard objectives add gm4_ic_chrg_mo_p dummy
scoreboard objectives add gm4_ic_chrg_mo dummy
scoreboard objectives add gm4_ic_chrg_ma dummy
scoreboard objectives add gm4_ic_chrg_use dummy
scoreboard objectives add gm4_ic_chrg_up dummy

team add gm4_ic_fail
team add gm4_ic_success
team modify gm4_ic_fail color red
team modify gm4_ic_success color green

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Impulse Cores Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.impulse_cores"}]}]}]
execute unless entity @a[limit=1] run say GM4: Impulse Cores Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
