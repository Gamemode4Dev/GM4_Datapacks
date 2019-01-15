#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Sunken Treasure..."}]
execute unless entity @p run say GM4: Installing Sunken Treasure...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set sunken_treasure gm4_modules 1
scoreboard players set sunken_treasure gm4_clock_tick 0

scoreboard objectives add gm4_st_sand minecraft.mined:minecraft.sand
scoreboard objectives add gm4_st_fortune dummy
scoreboard objectives add gm4_st_random dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Sunken Treasure Installed!"}]
execute unless entity @p run say GM4: Sunken Treasure Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
