#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Magical Musical Jukeboxes...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.magical_musical_jukeboxes"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Magical Musical Jukeboxes...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set magical_musical_jukeboxes gm4_modules 1
scoreboard players set magical_musical_jukeboxes gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Magical Musical Jukeboxes Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.magical_musical_jukeboxes"}]}]}]
execute unless entity @a[limit=1] run say GM4: Magical Musical Jukeboxes Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
