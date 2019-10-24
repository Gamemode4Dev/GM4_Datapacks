#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Desire Lines...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.desire_lines"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Desire Lines...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set desire_lines gm4_modules 1
scoreboard players set desire_lines gm4_clock_tick 0

scoreboard objectives add gm4_dl_random dummy
scoreboard objectives add gm4_desire_lines minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add gm4_dl_sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_dl_affcoarse dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Desire Lines Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.desire_lines"}]}]}]
execute unless entity @a[limit=1] run say GM4: Desire Lines Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
