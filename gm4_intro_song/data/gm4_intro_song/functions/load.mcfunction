execute if score gm4 load.status matches 1 run scoreboard players set gm4_intro_song load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Intro Song",require:"Gamemode 4"}

execute if score gm4_intro_song load.status matches 1 run function gm4_intro_song:init
