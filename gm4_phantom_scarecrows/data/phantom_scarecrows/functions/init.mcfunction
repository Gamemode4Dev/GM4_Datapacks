#announce module installation
tellraw @a ["",{"text":"[GM4]: Installing Phantom Scarecrows..."}]
execute unless entity @p run say GM4: Installing Phantom Scarecrows...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set phantom_scarecrows gm4_modules 1
scoreboard players set phantom_scarecrows gm4_clock_tick 0
scoreboard objectives add gm4_ps_time dummy
scoreboard players set modulo gm4_ps_time 3

#announce success
tellraw @a ["",{"text":"[GM4]: Phantom Scarecrows Installed!"}]
execute unless entity @p run say GM4: Phantom Scarecrows Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
