execute if score gm4 load.status matches 1 run scoreboard players set gm4_podzol_rooting_soil load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Podzol Rooting Soil",require:"Gamemode 4"}

execute if score gm4_podzol_rooting_soil load.status matches 1 run function gm4_podzol_rooting_soil:init
execute unless score gm4_podzol_rooting_soil load.status matches 1 run schedule clear gm4_podzol_rooting_soil:main
