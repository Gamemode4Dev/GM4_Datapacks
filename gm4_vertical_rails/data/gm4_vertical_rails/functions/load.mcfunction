execute if score gm4 load matches 1 run scoreboard players set gm4_vertical_rails load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Vertical Rails",require:"Gamemode 4"}

execute if score gm4_vertical_rails load matches 1 run function gm4_vertical_rails:init
execute unless score gm4_vertical_rails load matches 1 run schedule clear gm4_vertical_rails:main
execute unless score gm4_vertical_rails load matches 1 run schedule clear gm4_vertical_rails:tick
