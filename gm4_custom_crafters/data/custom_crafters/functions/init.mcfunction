#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Custom Crafters..."}]
execute unless entity @p run say GM4: Installing Custom Crafters...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set custom_crafters gm4_modules 1
scoreboard players set custom_crafters gm4_clock_tick 0

scoreboard objectives add gm4_slot_count dummy
scoreboard objectives add gm4_stack_size dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Custom Crafters Installed!"}]
execute unless entity @p run say GM4: Custom Crafters Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
