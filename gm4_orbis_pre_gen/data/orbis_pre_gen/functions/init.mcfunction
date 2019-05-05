#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Custom Terrain Pre-gen..."}]
execute unless entity @p run say GM4: Installing Custom Terrain Pre-gen...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set orbis_pre_gen gm4_modules 1
scoreboard players set orbis_pre_gen gm4_clock_tick 0

scoreboard objectives add gm4_orbis_config dummy "Orbis Config"
scoreboard players set pre_gen_running gm4_orbis_config 0
scoreboard players set x1 gm4_orbis_config -1024
scoreboard players set z1 gm4_orbis_config -1024
scoreboard players set x2 gm4_orbis_config 1024
scoreboard players set z2 gm4_orbis_config 1024

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Custom Terrain Pre-gen Installed!"}]
execute unless entity @p run say GM4: Custom Terrain Pre-gen Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
