#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Particles Pack...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.particles_pack"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Particles Pack...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set particles_pack gm4_modules 1
scoreboard players set particles_pack gm4_clock_tick 0

scoreboard objectives add gm4_particle dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Particles Pack Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.particles_pack"}]}]}]
execute unless entity @a[limit=1] run say GM4: Particles Pack Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
