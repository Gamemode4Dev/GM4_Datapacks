#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Enchantment Extractors..."}]
execute unless entity @p run say GM4: Installing Enchantment Extractors...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set enchantment_extractors gm4_modules 1
scoreboard players set enchantment_extractors gm4_clock_tick 0

scoreboard objectives add gm4_ench_random dummy
execute unless score seed gm4_ench_random matches 0.. run scoreboard players set seed gm4_ench_random 731031
scoreboard players set mult gm4_ench_random 1664525
scoreboard players set incr gm4_ench_random 1013904223
scoreboard players set #100 gm4_ench_random 100

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Enchantment Extractors Installed!"}]
execute unless entity @p run say GM4: Enchantment Extractors Installed!

#check other modules to make sure they're up to date.
#moduleUpdateList
