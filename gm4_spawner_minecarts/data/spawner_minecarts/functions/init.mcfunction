#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Spawner Minecarts..."}]
execute unless entity @p run say GM4: Installing Spawner Minecarts...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set spawner_minecarts gm4_modules 1
scoreboard players set spawner_minecarts gm4_clockTick 0
scoreboard objectives add gm4_spawner_fuel dummy
scoreboard objectives add gm4_spawner_time dummy
scoreboard objectives add gm4_spawner_data dummy
scoreboard objectives add gm4_sm_flowers dummy
function spawner_minecarts:fuel/initiate_flower_types

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Spawner Minecarts Installed!"}]
execute unless entity @p run say GM4: Spawner Minecarts Installed!

#check other modules to make sure they're up to date.
execute if score some_module gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Some Module\"",Tags:["updateMessage"],Duration:2000}
execute if score some_other_module gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
