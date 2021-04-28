execute if score gm4 load matches 1 run scoreboard players set gm4_ziprails load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Ziprails",require:"Gamemode 4"}

execute if score gm4_ziprails load matches 1 run function gm4_ziprails:init
execute unless score gm4_ziprails load matches 1 run schedule clear gm4_ziprails:tick
