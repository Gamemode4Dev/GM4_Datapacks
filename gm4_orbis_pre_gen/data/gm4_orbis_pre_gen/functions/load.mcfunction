execute if score gm4 load matches 1 if score gm4_orbis load matches 1 run scoreboard players set gm4_orbis_pre_gen load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Orbis Pre Gen",require:"Gamemode 4"}
execute unless score gm4_orbis load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Orbis Pre Gen",require:"Orbis"}

execute if score gm4_orbis_pre_gen load matches 1 run function orbis_pre_gen:init
execute unless score gm4_orbis_pre_gen load matches 1 run schedule clear orbis_pre_gen:tick
