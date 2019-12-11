execute if score gm4 load matches 1 run scoreboard players set gm4_end_fishing load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"End Fishing",require:"Gamemode 4"}

execute if score gm4_end_fishing load matches 1 run function gm4_end_fishing:init
execute unless score gm4_end_fishing load matches 1 run schedule clear end_fishing:main
execute unless score gm4_end_fishing load matches 1 run schedule clear end_fishing:tick
