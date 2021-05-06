execute if score gm4 load matches 1 run scoreboard players set gm4_rational_villagers load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"rational villagers",require:"Gamemode 4"}

execute if score gm4_rational_villagers load matches 1 run function gm4_rational_villagers:init
execute unless score gm4_rational_villagers load matches 1 run schedule clear gm4_rational_villagers:main
