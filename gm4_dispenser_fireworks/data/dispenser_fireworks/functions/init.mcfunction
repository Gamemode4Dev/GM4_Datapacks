#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Dispenser Fireworks...",{"translate":"text.gm4.modules.update.installing","with":["Dispenser Fireworks"]}]}]
execute unless entity @p run say GM4: Installing Dispenser Fireworks...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set dispenser_fireworks gm4_modules 1
scoreboard players set dispenser_fireworks gm4_clock_tick 0

scoreboard objectives add gm4_df_mod_count dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Dispenser Fireworks Installed!",{"translate":"text.gm4.modules.update.installed","with":["Dispenser Fireworks"]}]}]
execute unless entity @p run say GM4: Dispenser Fireworks Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
