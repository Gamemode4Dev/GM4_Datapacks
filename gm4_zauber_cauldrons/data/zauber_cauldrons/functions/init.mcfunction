#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Zauber Cauldrons...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.zauber_armour"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Zauber Cauldrons...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set zauber_cauldrons gm4_modules 2
scoreboard players set zauber_cauldrons gm4_clock_tick 0

#create needed scoreboards
scoreboard objectives add gm4_zc_data dummy "gm4_zauber_cauldrons_data"
scoreboard objectives add gm4_zc_flowers dummy "gm4_zauber_cauldrons_flowers"
scoreboard objectives add gm4_zc_chorus dummy "gm4_zauber_cauldrons_chorus"
scoreboard objectives add gm4_zc_fullness dummy "gm4_zauber_cauldrons_fullness"
scoreboard objectives add gm4_zc_deaths deathCount "gm4_zauber_cauldrons_deaths"
scoreboard objectives add gm4_zc_warp_mx dummy "gm4_zauber_cauldrons_warp_mx"
scoreboard objectives add gm4_zc_warp_my dummy "gm4_zauber_cauldrons_warp_my"
scoreboard objectives add gm4_zc_warp_mz dummy "gm4_zauber_cauldrons_warp_mz"
scoreboard objectives add gm4_zc_warp_md dummy "gm4_zauber_cauldrons_warp_md"
scoreboard objectives add gm4_zc_warp_ox dummy "gm4_zauber_cauldrons_warp_ox"
scoreboard objectives add gm4_zc_warp_oy dummy "gm4_zauber_cauldrons_warp_oy"
scoreboard objectives add gm4_zc_warp_oz dummy "gm4_zauber_cauldrons_warp_oz"
scoreboard objectives add gm4_zc_warp_od dummy "gm4_zauber_cauldrons_warp_od"
function zauber_cauldrons:recipes/flowers/initiate_flower_types
function zauber_cauldrons:recipes/chorus/initiate_chorus_amounts
scoreboard players set modulo gm4_zc_fullness 3

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Zauber Cauldrons Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.zauber_armour"}]}]}]
execute unless entity @a[limit=1] run say GM4: Zauber Cauldrons Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
