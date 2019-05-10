#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Heart Canisters...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.heart_canisters"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Heart Canisters...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set heart_canisters gm4_modules 1
scoreboard players set heart_canisters gm4_clock_tick 0

scoreboard objectives add gm4_heart_can dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Heart Canisters Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.heart_canisters"}]}]}]
execute unless entity @a[limit=1] run say GM4: Heart Canisters Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
