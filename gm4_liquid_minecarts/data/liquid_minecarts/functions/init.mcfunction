#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Liquid Minecarts..."}]
execute unless entity @p run say GM4: Installing Liquid Minecarts...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set liquid_minecarts gm4_modules 1
scoreboard players set liquid_minecarts gm4_clock_tick 0

scoreboard objectives add gm4_lm_data dummy
scoreboard players set 5 gm4_lm_data 5
scoreboard players set 2 gm4_lm_data 2
scoreboard players set 100 gm4_lm_data 100

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Liquid Minecarts Installed!"}]
execute unless entity @p run say GM4: Liquid Minecarts Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
