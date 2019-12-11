execute if score gm4 load matches 1 run scoreboard players set gm4_sunken_treasure load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Sunken Treasure",require:"Gamemode 4"}

execute if score gm4_sunken_treasure load matches 1 run function sunken_treasure:init
execute unless score gm4_sunken_treasure load matches 1 run schedule clear sunken_treasure:tick
