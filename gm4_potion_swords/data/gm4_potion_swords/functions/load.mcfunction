execute if score gm4 load matches 1 run scoreboard players set gm4_potion_swords load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Potion Swords",require:"Gamemode 4"}

execute if score gm4_potion_swords load matches 1 run function potion_swords:init
execute unless score gm4_potion_swords load matches 1 run schedule clear potion_swords:tick
