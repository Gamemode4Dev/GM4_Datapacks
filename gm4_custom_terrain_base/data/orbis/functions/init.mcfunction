#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Custom Terrain Base..."}]
execute unless entity @p run say GM4: Installing Custom Terrain Base...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set custom_terrain_base gm4_modules 1
scoreboard players set custom_terrain_base gm4_clock_tick 0
scoreboard players set custom_terrain_base_4 gm4_clock_tick 4
scoreboard players set custom_terrain_base_8 gm4_clock_tick 8
scoreboard players set custom_terrain_base_12 gm4_clock_tick 12

scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_orbis_biome dummy
scoreboard objectives add gm4_orbis_config dummy
scoreboard players set speed gm4_orbis_config 1
scoreboard players add orbis_generated gm4_count 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Custom Terrain Base Installed!"}]
execute unless entity @p run say GM4: Custom Terrain Base Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
