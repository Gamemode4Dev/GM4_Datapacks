#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Pulverizers..."}]
execute unless entity @p run say GM4: Installing Pulverizers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set pulverizers gm4_modules 1
scoreboard players set pulverizers gm4_clock_tick 0

scoreboard objectives add gm4_slot_count dummy
scoreboard objectives add gm4_stack_size dummy
scoreboard objectives add gm4_string dummy

scoreboard objectives add gm4_pv_bonus dummy
execute unless score seed gm4_pv_bonus matches 0.. run scoreboard players set seed gm4_pv_bonus 731031
scoreboard players set mult gm4_pv_bonus 1664525
scoreboard players set incr gm4_pv_bonus 1013904223
scoreboard players set #100 gm4_pv_bonus 100

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Pulverizers Installed!"}]
execute unless entity @p run say GM4: Pulverizers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
