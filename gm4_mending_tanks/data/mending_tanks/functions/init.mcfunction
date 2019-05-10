#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: Installing Mending Tanks...",[{"translate":"text.gm4.prefix"},{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.mending.tanks"}]}]]}]
execute unless entity @a[limit=1] run say GM4: Installing Mending Tanks...


#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_upCheck 1
scoreboard players set mending_tanks gm4_modules 1
scoreboard players set mending_tanks gm4_clock_tick 0

# make sure this exists
scoreboard objectives add gm4_lt_util dummy
scoreboard players set #mt_repair_per_xp gm4_lt_util 2
scoreboard players set #mt_max_repair gm4_lt_util 32

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: Mending Tanks Installed!",[{"translate":"text.gm4.prefix"},{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.mending.tanks"}]}]]}]
execute unless entity @a[limit=1] run say GM4: Mending Tanks Installed!


#check other modules to make sure they're up to date.
#$moduleUpdateList
