execute if score gm4 load matches 1 if score gm4_liquid_tanks load matches 1 run scoreboard players set gm4_ambrosia load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Ambrosia",require:"Gamemode 4"}
execute unless score gm4_liquid_tanks load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Ambrosia",require:"Liquid Tanks"}

execute if score gm4_ambrosia load matches 1 run function ambrosia:init
execute unless score gm4_ambrosia load matches 1 run schedule clear ambrosia:main
execute unless score gm4_ambrosia load matches 1 run schedule clear ambrosia:tick
