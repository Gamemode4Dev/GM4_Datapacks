execute if score gm4 load matches 1 if score gm4_custom_crafters load matches 1 if score gm4_potion_liquids load matches 1 run scoreboard players set gm4_potion_infusers load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Potion Infusers",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Potion Infusers",require:"Custom Crafters"}
execute unless score gm4_potion_liquids load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Potion Infusers",require:"Potion Liquids"}

execute if score gm4_potion_infusers load matches 1 run function gm4_potion_infusers:init
execute unless score gm4_potion_infusers load matches 1 run schedule clear gm4_potion_infusers:main
