execute if score gm4 load matches 1 run scoreboard players set gm4_metallurgy load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Metallurgy",require:"Gamemode 4"}

execute if score gm4_metallurgy load matches 1 run function metallurgy:init
execute unless score gm4_metallurgy load matches 1 run schedule clear metallurgy:main
execute unless score gm4_metallurgy load matches 1 run schedule clear metallurgy:tick
