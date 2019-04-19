#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Spawner Minecarts..."}]
execute unless entity @p run say GM4: Installing Spawner Minecarts...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set spawner_minecarts gm4_modules 1
scoreboard players set spawner_minecarts gm4_clock_tick 0
scoreboard objectives add gm4_spawner_fuel dummy
scoreboard objectives add gm4_spawner_time dummy
scoreboard objectives add gm4_spawner_data dummy
scoreboard objectives add gm4_sm_flowers dummy
function spawner_minecarts:fuel/initiate_flower_types

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Spawner Minecarts Installed!"}]
execute unless entity @p run say GM4: Spawner Minecarts Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
