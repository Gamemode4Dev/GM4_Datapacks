#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Note Block Interface...",{"translate":"text.gm4.modules.update.installing","with":["Note Block Interface"]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Note Block Interface...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set note_block_interface gm4_modules 1
scoreboard players set note_block_interface gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Note Block Interface Installed!",{"translate":"text.gm4.modules.update.installed","with":["Note Block Interface"]}]}]
execute unless entity @a[limit=1] run say GM4: Note Block Interface Installed!

scoreboard objectives add gm4_nbi_punch minecraft.custom:minecraft.play_noteblock
scoreboard objectives add gm4_nbi_click minecraft.custom:minecraft.tune_noteblock
scoreboard objectives add gm4_nbi_sneak minecraft.custom:minecraft.sneak_time 
scoreboard objectives add gm4_nbi_ray dummy
scoreboard objectives add gm4_nbi_change dummy

#check other modules to make sure they're up to date.
#$moduleUpdateList
