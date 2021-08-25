execute if score gm4 load.status matches 1 if score gm4_forceload load.status matches 1 if score gm4_player_heads load.status matches 1 if score gm4_brewing load.status matches 1 run scoreboard players set gm4_zauber_cauldrons load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Zauber Cauldrons",require:"Gamemode 4"}
execute unless score gm4_forceload load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Zauber Cauldrons",require:"lib_forceload"}
execute unless score gm4_player_heads load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Zauber Cauldrons",require:"lib_player_heads"}
execute unless score gm4_brewing load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Zauber Cauldrons",require:"lib_brewing"}

execute if score gm4_zauber_cauldrons load.status matches 1 run function gm4_zauber_cauldrons:init
execute unless score gm4_zauber_cauldrons load.status matches 1 run schedule clear gm4_zauber_cauldrons:main
execute unless score gm4_zauber_cauldrons load.status matches 1 run schedule clear gm4_zauber_cauldrons:cauldron/extra_items/crack_bottle
