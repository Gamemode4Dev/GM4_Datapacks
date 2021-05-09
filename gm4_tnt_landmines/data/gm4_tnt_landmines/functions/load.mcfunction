execute if score gm4 load matches 1 if score gm4_custom_crafters load matches 1 if score gm4_player_heads load matches 1 run scoreboard players set gm4_tnt_landmines load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"TNT Landmines",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"TNT Landmines",require:"Custom Crafters"}
execute unless score gm4_player_heads load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"TNT Landmines",require:"lib_player_heads"}

execute if score gm4_tnt_landmines load matches 1 run function gm4_tnt_landmines:init
execute unless score gm4_tnt_landmines load matches 1 run schedule clear gm4_tnt_landmines:main
