execute if score gm4 load.status matches 1 if score gm4_lore load.status matches 1 run scoreboard players set gm4_metallurgy load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Metallurgy",require:"Gamemode 4"}
execute unless score gm4_lore load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Metallurgy",require:"lib-lore"}

execute if score gm4_metallurgy load.status matches 1 run function gm4_metallurgy:init
execute unless score gm4_metallurgy load.status matches 1 run schedule clear gm4_metallurgy:main
execute unless score gm4_metallurgy load.status matches 1 run schedule clear gm4_metallurgy:tick
