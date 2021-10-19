execute if score gm4 load.status matches 1 run scoreboard players set gm4_shroomites load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Shroomites",require:"Gamemode 4"}

execute if score gm4_shroomites load.status matches 1 run function gm4_shroomites:init
execute unless score gm4_shroomites load.status matches 1 run schedule clear gm4_shroomites:main
execute unless score gm4_shroomites load.status matches 1 run schedule clear gm4_shroomites:slow_clock
