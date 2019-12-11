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

execute unless score zauber_cauldrons gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Zauber Cauldrons"}
scoreboard players set zauber_cauldrons gm4_modules 1

schedule function zauber_cauldrons:main 1t

#$moduleUpdateList
