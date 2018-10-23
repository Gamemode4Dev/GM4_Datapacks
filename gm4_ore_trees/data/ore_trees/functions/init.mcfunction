#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Ore Trees..."}]
execute unless entity @p run say GM4: Installing Ore Trees...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set ore_trees gm4_modules 1
scoreboard players set ore_trees gm4_clockTick 0

scoreboard objectives add gm4_ortr_time dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Ore Trees Installed!"}]
execute unless entity @p run say GM4: Ore Trees Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}