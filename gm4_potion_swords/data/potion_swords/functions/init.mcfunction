#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Potion Swords...",{"translate":"text.gm4.modules.update.installing","with":["Potion Swords"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Potion Swords...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set potion_swords gm4_modules 1
scoreboard players set potion_swords gm4_clock_tick 0
scoreboard objectives add gm4_gold_sword minecraft.used:minecraft.golden_sword

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Potion Swords Installed!",{"translate":"text.gm4.modules.update.installed","with":["Potion Swords"]}]}]
execute unless entity @a[limit=1] run say GM4: Potion Swords Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
