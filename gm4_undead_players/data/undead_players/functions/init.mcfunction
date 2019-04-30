#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Undead Players...",{"translate":"text.gm4.modules.update.installing","with":["Undead Players"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Undead Players...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set undead_players gm4_modules 1
scoreboard players set undead_players gm4_clock_tick 0

scoreboard objectives add gm4_undead minecraft.custom:minecraft.deaths

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Undead Players Installed!",{"translate":"text.gm4.modules.update.installed","with":["Undead Players"]}]}]
execute unless entity @a[limit=1] run say GM4: Undead Players Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
