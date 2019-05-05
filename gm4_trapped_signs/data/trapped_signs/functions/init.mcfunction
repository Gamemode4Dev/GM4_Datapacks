#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Trapped Signs..."}]
execute unless entity @p run say GM4: Installing Trapped Signs...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set trapped_signs gm4_modules 1
scoreboard players set trapped_signs gm4_clock_tick 0

scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_trapped_sign dummy
scoreboard objectives add gm4_place_sign minecraft.used:minecraft.sign

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Trapped Signs Installed!"}]
execute unless entity @p run say GM4: Trapped Signs Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
