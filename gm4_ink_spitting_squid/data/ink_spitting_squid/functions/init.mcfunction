#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Ink Spitting Squid...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.ink_spitting_squid"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Ink Spitting Squid...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set ink_spitting_squid gm4_modules 1
scoreboard players set ink_spitting_squid gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Ink Spitting Squid Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.ink_spitting_squid"}]}]}]
execute unless entity @a[limit=1] run say GM4: Ink Spitting Squid Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
