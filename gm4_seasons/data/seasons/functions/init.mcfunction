#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Seasons..."}]
execute unless entity @p run say GM4: Installing Seasons...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set seasons gm4_modules 1
scoreboard players set seasons gm4_clockTick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Seasons Installed!"}]
execute unless entity @p run say GM4: Seasons Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}



###SEASONS STUFF###
#SCOREBOARD OBJECTIVES
scoreboard objectives add szn_daytime dummy
scoreboard objectives add szn_day dummy
scoreboard objectives add szn_season dummy

scoreboard objectives add szn_timer dummy

scoreboard objectives add szn_effect dummy
scoreboard objectives add szn_drink minecraft.used:minecraft.potion
scoreboard objectives add szn_warmth dummy
scoreboard objectives add szn_death deathCount
scoreboard objectives add szn_weather dummy

scoreboard objectives add szn_mineLeavesO minecraft.mined:minecraft.oak_leaves
scoreboard objectives add szn_mineLeavesB minecraft.mined:minecraft.birch_leaves
scoreboard objectives add szn_mineLeavesD minecraft.mined:minecraft.dark_oak_leaves
scoreboard objectives add szn_mineLeavesJ minecraft.mined:minecraft.jungle_leaves

scoreboard objectives add szn_mineWheat minecraft.mined:minecraft.wheat

scoreboard objectives add szn_sleep dummy


#WEATHER
gamerule doWeatherCycle false
execute unless score szn_Detect szn_day matches 0..25 run weather clear

execute unless score szn_Detect szn_day matches 0..25 run scoreboard players set #maxrand szn_rng 8401
execute unless score szn_Detect szn_day matches 0..25 run function seasons:rng/nextrand
execute unless score szn_Detect szn_day matches 0..25 run scoreboard players operation szn_Cycle szn_weather = #randval szn_rng
execute unless score szn_Detect szn_day matches 0..25 run scoreboard players add szn_Cycle szn_weather 600


#SET TIME
execute unless score szn_Detect szn_day matches 0..25 run time set 0


#SETTING SCORES
execute unless score szn_Detect szn_day matches 0..25 run scoreboard players set szn_Detect szn_season 1
execute unless score szn_Detect szn_day matches 0..25 run scoreboard players set szn_Detect szn_day 1

scoreboard players set 2 szn_warmth 2


#RNG
function seasons:rng/load