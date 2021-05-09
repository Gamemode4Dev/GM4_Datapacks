execute if score gm4 load matches 1 if score gm4_forceload load matches 1 run scoreboard players set gm4_mysterious_midnights load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Mysterious Midnights",require:"Gamemode 4"}
execute unless score gm4_forceload load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Mysterious Midnights",require:"lib_forceload"}

execute if score gm4_mysterious_midnights load matches 1 run function gm4_mysterious_midnights:init
execute unless score gm4_mysterious_midnights load matches 1 run schedule clear gm4_mysterious_midnights:main
