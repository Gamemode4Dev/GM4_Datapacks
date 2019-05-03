#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Damaging Stonecutters...",{"translate":"text.gm4.modules.update.installing","with":["Damaging Stonecutters"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Damaging Stonecutters...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set damaging_stonecutters gm4_modules 1
scoreboard players set damaging_stonecutters gm4_clock_tick 0

scoreboard objectives add gm4_ds_dmg_tick dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Damaging Stonecutters Installed!",{"translate":"text.gm4.modules.update.installed","with":["Damaging Stonecutters"]}]}]
execute unless entity @a[limit=1] run say GM4: Damaging Stonecutters Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
