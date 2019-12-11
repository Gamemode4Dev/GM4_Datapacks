execute if score gm4 load matches 1 run scoreboard players set gm4_ink_spitting_squid load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Ink Spitting Squid",require:"Gamemode 4"}

execute if score gm4_ink_spitting_squid load matches 1 run function gm4_ink_spitting_squid:init
execute unless score gm4_ink_spitting_squid load matches 1 run schedule clear gm4_ink_spitting_squid:main
