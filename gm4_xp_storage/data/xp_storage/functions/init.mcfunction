#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing XP Storage..."}]
execute unless entity @p run say GM4: Installing XP Storage...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set xp_storage gm4_modules 1
scoreboard players set xp_storage gm4_clock_tick 0

scoreboard objectives add gm4_stored_xp dummy
scoreboard objectives add gm4_xp_sneaking minecraft.custom:minecraft.sneak_time
scoreboard objectives add gm4_xp_calc dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: XP Storage Installed!"}]
execute unless entity @p run say GM4: XP Storage Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
