execute if score gm4 load matches 1 if score gm4_mysterious_midnights load matches 1 run scoreboard players set gm4_midnight_menaces load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Midnight Menaces",require:"Gamemode 4"}
execute unless score gm4_mysterious_midnights load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Midnight Menaces",require:"Mysterious Midnights"}

execute if score gm4_midnight_menaces load matches 1 run function gm4_midnight_menaces:init
execute unless score gm4_midnight_menaces load matches 1 run schedule clear gm4_menacing_goblins:main
