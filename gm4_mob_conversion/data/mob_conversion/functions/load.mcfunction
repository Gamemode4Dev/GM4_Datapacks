execute if score gm4 load matches 1 run scoreboard players set gm4_mob_conversion load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Mob Conversion",require:"Gamemode 4"}

execute if score gm4_mob_conversion load matches 1 run function mob_conversion:init
execute unless score gm4_mob_conversion load matches 1 run schedule clear mob_conversion:main
