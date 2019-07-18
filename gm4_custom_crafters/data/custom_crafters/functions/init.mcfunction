#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Custom Crafters...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.custom_crafters"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Custom Crafters...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set custom_crafters gm4_modules 1
scoreboard players set custom_crafters gm4_clock_tick 0

scoreboard objectives add gm4_slot_count dummy
scoreboard objectives add gm4_stack_size dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Custom Crafters Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.custom_crafters"}]}]}]
execute unless entity @a[limit=1] run say GM4: Custom Crafters Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
