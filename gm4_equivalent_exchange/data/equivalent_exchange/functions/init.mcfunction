#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Equivalent Exchange..."}]
execute unless entity @p run say GM4: Installing Equivalent Exchange...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set equivalent_exchange gm4_modules 1
scoreboard players set equivalent_exchange gm4_clock_tick 0

scoreboard objectives add gm4_alch_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add gm4_charge_level dummy

function rng:load

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Equivalent Exchange Installed!"}]
execute unless entity @p run say GM4: Equivalent Exchange Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
