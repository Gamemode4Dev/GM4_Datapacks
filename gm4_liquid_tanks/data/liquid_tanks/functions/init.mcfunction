#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Liquid Tanks..."}]
execute unless entity @p run say GM4: Installing Liquid Tanks...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_upCheck 1
scoreboard players set liquid_tanks gm4_modules 1
scoreboard players set liquid_tanks gm4_clock_tick 0

scoreboard objectives add gm4_lt_value dummy
scoreboard objectives add gm4_lt_max dummy
scoreboard objectives add gm4_lt_buffer dummy
#scoreboard objectives add gm4_lt_disp_max
scoreboard objectives add gm4_lt_disp_val dummy
scoreboard objectives add gm4_lt_util dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Liquid Tanks Installed!"}]
execute unless entity @p run say GM4: Liquid Tanks Installed!

#check other modules to make sure they're up to date.
execute if score some_module gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Some Module\"",Tags:["updateMessage"],Duration:2000}
execute if score some_other_module gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
