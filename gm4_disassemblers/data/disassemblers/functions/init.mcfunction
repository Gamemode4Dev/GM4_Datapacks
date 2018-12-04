#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Disassemblers..."}]
execute unless entity @p run say GM4: Installing Disassemblers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set disassemblers gm4_modules 1
scoreboard players set disassemblers gm4_clock_tick 0

scoreboard objectives add gm4_disassembler dummy
scoreboard players set #100 gm4_disassembler 100
scoreboard players set #2 gm4_disassembler 2

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Disassemblers Installed!"}]
execute unless entity @p run say GM4: Disassemblers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
