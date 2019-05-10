#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing SCUBA Gear...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.scuba_gear"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing SCUBA Gear...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set scuba_gear gm4_modules 1
scoreboard players set scuba_gear gm4_clock_tick 0

scoreboard objectives add gm4_sg_swim minecraft.custom:minecraft.swim_one_cm

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["SCUBA Gear Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.scuba_gear"}]}]}]
execute unless entity @a[limit=1] run say GM4: SCUBA Gear Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
