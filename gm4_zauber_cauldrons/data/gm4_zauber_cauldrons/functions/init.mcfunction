scoreboard objectives add gm4_zc_data dummy "gm4_zauber_cauldrons_data"
scoreboard objectives add gm4_zc_flowers dummy "gm4_zauber_cauldrons_flowers"
scoreboard objectives add gm4_zc_chorus dummy "gm4_zauber_cauldrons_chorus"
scoreboard objectives add gm4_zc_fullness dummy "gm4_zauber_cauldrons_fullness"
scoreboard objectives add gm4_zc_deaths deathCount "gm4_zauber_cauldrons_deaths"
scoreboard objectives add gm4_zc_id dummy "gm4_zauber_cauldrons_sips"
function gm4_zauber_cauldrons:recipes/flowers/initiate_flower_types
function gm4_zauber_cauldrons:recipes/chorus/initiate_chorus_amounts
scoreboard players set modulo gm4_zc_fullness 3

# This module includes the gm4 forceload library. If you didn't get this pack from our website, make sure you have the gm4 forceload library installed!

execute unless score zauber_cauldrons gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Zauber Cauldrons"}
scoreboard players set zauber_cauldrons gm4_modules 1

schedule function gm4_zauber_cauldrons:main 1t

#$moduleUpdateList
