execute if score gm4 load matches 1 run scoreboard players set gm4_desire_lines load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Desire Lines",require:"Gamemode 4"}

execute if score gm4_desire_lines load matches 1 run function gm4_desire_lines:init
execute unless score gm4_desire_lines load matches 1 run schedule clear desire_lines:tick
