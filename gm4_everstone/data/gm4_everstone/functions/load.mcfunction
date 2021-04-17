execute if score gm4 load matches 1 run scoreboard players set gm4_everstone load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Everstone",require:"Gamemode 4"}

execute if score gm4_everstone load matches 1 run function gm4_everstone:init
execute unless score gm4_everstone load matches 1 run schedule clear gm4_everstone:main
execute unless score gm4_everstone load matches 1 run schedule clear gm4_everstone:tick
execute unless score gm4_everstone load matches 1 run schedule clear gm4_everstone:aging
