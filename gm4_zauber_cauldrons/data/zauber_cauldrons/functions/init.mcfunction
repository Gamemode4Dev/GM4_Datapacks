#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Zauber Cauldrons..."}]
execute unless entity @p run say GM4: Installing Zauber Cauldrons...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set zauber_cauldrons gm4_modules 1
scoreboard players set zauber_cauldrons gm4_clock_tick 0

#create needed scoreboards
scoreboard objectives add gm4_zc_data dummy "gm4_zauber_cauldrons_data"
scoreboard objectives add gm4_zc_flowers dummy "gm4_zauber_cauldrons_flowers"
scoreboard objectives add gm4_zc_fullness dummy "gm4_zauber_cauldrons_fullness"
scoreboard objectives add gm4_zc_deaths deathCount "gm4_zauber_cauldrons_deaths"
function zauber_cauldrons:recipes/flowers/initiate_flower_types

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Zauber Cauldrons Installed!"}]
execute unless entity @p run say GM4: Zauber Cauldrons Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
