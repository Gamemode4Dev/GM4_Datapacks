execute if score gm4 load matches 1 run scoreboard players set gm4_shroomites load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Shroomites",require:"Gamemode 4"}

execute if score gm4_shroomites load matches 1 run function gm4_shroomites:init
execute unless score gm4_shroomites load matches 1 run schedule clear shroomites:main
