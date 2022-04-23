execute if score gm4 load.status matches 1 if score gm4_liquid_tanks load.status matches 2 if score gm4_zauber_cauldrons load.status matches 1 run scoreboard players set gm4_zauber_liquids load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Zauber Liquids",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Zauber Liquids",require:"Liquid Tanks"}
execute unless score gm4_zauber_cauldrons load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Zauber Liquids",require:"Zauber Cauldrons"}

execute if score gm4_zauber_liquids load.status matches 1 run function gm4_zauber_liquids:init
