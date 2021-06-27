execute if score gm4 load.status matches 1 if score gm4_player_heads load.status matches 1 run scoreboard players set gm4_end_fishing load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"End Fishing",require:"Gamemode 4"}
execute unless score gm4_player_heads load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"End Fishing",require:"lib_player_heads"}

execute if score gm4_end_fishing load.status matches 1 run function gm4_end_fishing:init
execute unless score gm4_end_fishing load.status matches 1 run schedule clear gm4_end_fishing:main
execute unless score gm4_end_fishing load.status matches 1 run schedule clear gm4_end_fishing:tick
