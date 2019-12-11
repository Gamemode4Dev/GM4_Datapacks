execute if score gm4 load matches 1 run scoreboard players set gm4_undead_players load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Undead Players",require:"Gamemode 4"}

execute if score gm4_undead_players load matches 1 run function gm4_undead_players:init
execute unless score gm4_undead_players load matches 1 run schedule clear undead_players:main
