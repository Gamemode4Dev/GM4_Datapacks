execute if score gm4 load matches 1 if score gm4_metallurgy load matches 1 run scoreboard players set gm4_moneo_shamir load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Moneo Shamir",require:"Gamemode 4"}
execute unless score gm4_metallurgy load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Moneo Shamir",require:"Metallurgy"}

execute if score gm4_moneo_shamir load matches 1 run function moneo_shamir:init
