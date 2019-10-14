#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Liquid Tanks...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.liquid_tanks"}]}]}]
execute unless entity @p run say GM4: Installing Liquid Tanks...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_upCheck 1
scoreboard players set liquid_tanks gm4_modules 1
scoreboard players set liquid_tanks gm4_clock_tick 0

scoreboard objectives add gm4_lt_value dummy
scoreboard objectives add gm4_lt_max dummy
scoreboard objectives add gm4_lt_buffer dummy
#scoreboard objectives add gm4_lt_disp_max
scoreboard objectives add gm4_lt_disp_val dummy
scoreboard objectives add gm4_lt_util dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Liquid Tanks Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.liquid_tanks"}]}]}]
execute unless entity @p run say GM4: Liquid Tanks Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
