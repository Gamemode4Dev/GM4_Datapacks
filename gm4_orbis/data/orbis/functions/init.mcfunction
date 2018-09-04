#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Orbis..."}]
execute unless entity @p run say GM4: Installing Orbis...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set orbis gm4_modules 1
scoreboard players set orbis gm4_clockTick 0

scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_orbis_biome dummy
# scores to keep track of numbers
scoreboard players add orbis_generated gm4_count 0
scoreboard players add orbis_towers gm4_count 0
scoreboard players add orbis_dungeons gm4_count 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Orbis Installed!"}]
execute unless entity @p run say GM4: Orbis Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}
