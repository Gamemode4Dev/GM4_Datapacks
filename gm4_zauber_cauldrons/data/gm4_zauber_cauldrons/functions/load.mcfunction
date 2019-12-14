execute if score gm4 load matches 1 run scoreboard players set gm4_zauber_cauldrons load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Zauber Cauldrons",require:"Gamemode 4"}

execute if score gm4_zauber_cauldrons load matches 1 run function gm4_zauber_cauldrons:init
execute unless score gm4_zauber_cauldrons load matches 1 run schedule clear gm4_zauber_cauldrons:main
