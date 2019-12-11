execute if score gm4 load matches 1 if score gm4_liquid_tanks load matches 1 run scoreboard players set gm4_orbis load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Orbis",require:"Gamemode 4"}

execute if score gm4_orbis load matches 1 run function orbis:init
execute unless score gm4_orbis load matches 1 run schedule clear orbis:tick
