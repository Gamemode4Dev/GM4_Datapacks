#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Weighted Armour...",{"translate":"text.gm4.modules.update.installing","with":["Weighted Armour"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Weighted Armour...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set weighted_armour gm4_modules 1
scoreboard players set weighted_armour gm4_clock_tick 0

scoreboard objectives add gm4_armor armor

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Weighted Armour Installed!",{"translate":"text.gm4.modules.update.installed","with":["Weighted Armour"]}]}]
execute unless entity @a[limit=1] run say GM4: Weighted Armour Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
