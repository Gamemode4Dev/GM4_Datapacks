#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Potion Swords..."}]
execute unless entity @p run say GM4: Installing Potion Swords...

#declare and initialise scoreboards, teams and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set potion_swords gm4_modules 1
scoreboard players set potion_swords gm4_clock_tick 0
scoreboard objectives add gm4_gold_sword minecraft.used:minecraft.golden_sword
team add gm4_ps_no_coll
team modify gm4_ps_no_coll collisionRule never

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Potion Swords Installed!"}]
execute unless entity @p run say GM4: Potion Swords Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
