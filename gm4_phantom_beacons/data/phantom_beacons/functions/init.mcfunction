# Phantom Beacons Module by Chopper2112
# Nov 24, 2018


#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Phantom Beacons..."}]
execute unless entity @p run say GM4: Installing Phantom Beacons...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set phantom_beacons gm4_modules 1
scoreboard players set phantom_beacons gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Phantom Beacons Installed!"}]
execute unless entity @p run say GM4: Phantom Beacons Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList