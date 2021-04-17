execute if score gm4 load matches 1 if score gm4_metallurgy load matches 1 if score gm4_custom_crafters load matches 1 run scoreboard players set gm4_orb_of_ankou load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Orb of Ankou",require:"Gamemode 4"}
execute unless score gm4_metallurgy load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Orb of Ankou",require:"Metallurgy"}
execute unless score gm4_custom_crafters load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Orb of Ankou",require:"Custom Crafters"}

execute if score gm4_orb_of_ankou load matches 1 run function gm4_orb_of_ankou:init
execute unless score gm4_orb_of_ankou load matches 1 run schedule clear gm4_orb_of_ankou:main
execute unless score gm4_orb_of_ankou load matches 1 run schedule clear gm4_orb_of_ankou:tick
