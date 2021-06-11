execute if score gm4 load.status matches 1 if score gm4_liquid_tanks load.status matches 1 run scoreboard players set gm4_potion_liquids load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Potion Liquids",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Potion Liquids",require:"Liquid Tanks"}

execute if score gm4_potion_liquids load.status matches 1 run function gm4_potion_liquids:init
