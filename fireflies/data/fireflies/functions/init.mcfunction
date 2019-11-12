#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing FireFlies..."}]
execute unless entity @p run say GM4: Installing FireFlies...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set fireflies gm4_modules 1
scoreboard players set fireflies gm4_clock_tick 0

# create scoreboard
scoreboard objectives add gm4_fireflies dummy "gm4_fireflies"

scoreboard players set 13000 gm4_fireflies 13000
scoreboard players set 23000 gm4_fireflies 23000

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: FireFlies Installed!"}]
execute unless entity @p run say GM4: FireFlies Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
