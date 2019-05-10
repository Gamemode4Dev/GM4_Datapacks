#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Mending Tanks..."}]
execute unless entity @p run say GM4: Installing Mending Tanks...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_upCheck 1
scoreboard players set mending_tanks gm4_modules 1
scoreboard players set mending_tanks gm4_clock_tick 0

# make sure this exists
scoreboard objectives add gm4_lt_util dummy
scoreboard players set #mt_repair_per_xp gm4_lt_util 2
scoreboard players set #mt_max_repair gm4_lt_util 32

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Mending Tanks Installed!"}]
execute unless entity @p run say GM4: Mending Tanks Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
