#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Particles Pack..."}]
execute unless entity @p run say GM4: Installing Particles Pack...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set particles_pack gm4_modules 1
scoreboard players set particles_pack gm4_clock_tick 0

scoreboard objectives add gm4_particle dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Particles Pack Installed!"}]
execute unless entity @p run say GM4: Particles Pack Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
