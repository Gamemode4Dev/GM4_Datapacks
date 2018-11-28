# Beacon Cores Module by Chopper2112
# Nov 26, 2018


#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Beacon Cores..."}]
execute unless entity @p run say GM4: Installing Beacon Cores...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set beacon_cores gm4_modules 1
scoreboard players set beacon_cores gm4_clock_tick 1
scoreboard objectives add gm4_beacon_fire dummy
scoreboard objectives add gm4_beacon_cores dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Beacon Cores Installed!"}]
execute unless entity @p run say GM4: Beacon Cores Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList