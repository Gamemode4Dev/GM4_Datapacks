execute if score gm4 load matches 1 run scoreboard players set gm4_better_fire load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Better Fire",require:"Gamemode 4"}

execute if score gm4_better_fire load matches 1 run function gm4_better_fire:init
execute unless score gm4_better_fire load matches 1 run schedule clear gm4_better_fire:main
