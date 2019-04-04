#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Heart Canisters..."}]
execute unless entity @p run say GM4: Installing Heart Canisters...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set heart_canisters gm4_modules 1
scoreboard players set heart_canisters gm4_clock_tick 0

scoreboard objectives add gm4_heart_can dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Heart Canisters Installed!"}]
execute unless entity @p run say GM4: Heart Canisters Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
