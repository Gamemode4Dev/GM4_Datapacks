execute if score gm4 load matches 1 run scoreboard players set gm4_chairs load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Chairs",require:"Gamemode 4"}

execute if score gm4_chairs load matches 1 run function chairs:init
execute unless score gm4_chairs load matches 1 run schedule clear chairs:main
