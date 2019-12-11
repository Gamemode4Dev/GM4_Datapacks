execute if score gm4 load matches 1 run scoreboard players set gm4_enderman_support_class load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Enderman Support Class",require:"Gamemode 4"}

execute if score gm4_enderman_support_class load matches 1 run function gm4_enderman_support_class:init
execute unless score gm4_enderman_support_class load matches 1 run schedule clear enderman_support_class:main
