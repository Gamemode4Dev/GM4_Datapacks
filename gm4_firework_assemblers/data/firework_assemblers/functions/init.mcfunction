#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Firework Assemblers...",{"translate":"text.gm4.modules.update.installing","with":["Firework Assemblers"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Firework Assemblers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set firework_assemblers gm4_modules 1
scoreboard players set firework_assemblers gm4_clock_tick 0

scoreboard objectives add gm4_fa_slot_cnt dummy
scoreboard objectives add gm4_fa_d_math_r dummy
scoreboard objectives add gm4_fa_d_math_fd dummy
scoreboard objectives add gm4_fa_d_math_fc dummy
scoreboard objectives add gm4_fa_d_math_gc dummy

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Firework Assemblers Installed!",{"translate":"text.gm4.modules.update.installed","with":["Firework Assemblers"]}]}]
execute unless entity @a[limit=1] run say GM4: Firework Assemblers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
