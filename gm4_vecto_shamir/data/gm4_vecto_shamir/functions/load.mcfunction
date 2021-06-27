execute if score gm4 load matches 1 if score gm4_metallurgy load matches 1 run scoreboard players set gm4_vecto_shamir load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Vecto Shamir",require:"Gamemode 4"}
execute unless score gm4_metallurgy load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Vecto Shamir",require:"Metallurgy"}

execute if score gm4_vecto_shamir load matches 1 run function gm4_vecto_shamir:init
execute unless score gm4_vecto_shamir load matches 1 run schedule clear gm4_vecto_shamir:main
