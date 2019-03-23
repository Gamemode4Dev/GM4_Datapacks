#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Custom Crafting +..."}]
execute unless entity @p run say GM4: Installing Custom Crafting +...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set custom_crafters_plus gm4_modules 1
scoreboard players set custom_crafters_plus gm4_clock_tick 0

scoreboard objectives add gm4_recipe_valid dummy
scoreboard objectives add gm4_itemset dummy
scoreboard objectives add gm4_itemcrafted dummy



#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Custom Crafting + Installed!"}]
execute unless entity @p run say GM4: Custom Crafting + Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
