#announce module installation
tellraw @a ["",{"text":"[GM4]: Installing Midnight Menaces..."}]
execute unless entity @a[limit=1] run say GM4: Installing Midnight Menaces...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set midnight_menaces gm4_modules 1
scoreboard players set midnight_menaces gm4_clock_tick 0

scoreboard objectives add gm4_reslimify dummy
scoreboard objectives add gm4_menace dummy
scoreboard players set 100 gm4_menace 100
scoreboard players set 17 gm4_menace 17
scoreboard players set 41 gm4_menace 41

#announce success
tellraw @a ["",{"text":"[GM4]: Midnight Menaces Installed!"}]
execute unless entity @a[limit=1] run say GM4: Midnight Menaces Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
