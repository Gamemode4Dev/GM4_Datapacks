execute if score gm4 load matches 1 run scoreboard players set gm4_phantom_scarecrows load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Phantom Scarecrows",require:"Gamemode 4"}

execute if score gm4_phantom_scarecrows load matches 1 run function gm4_phantom_scarecrows:init
execute unless score gm4_phantom_scarecrows load matches 1 run schedule clear gm4_phantom_scarecrows:main
execute unless score gm4_phantom_scarecrows load matches 1 run schedule clear gm4_phantom_scarecrows:tick
