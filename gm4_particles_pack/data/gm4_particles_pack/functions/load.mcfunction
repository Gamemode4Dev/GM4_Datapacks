execute if score gm4 load matches 1 if score gm4_better_armour_stands load matches 2 run scoreboard players set gm4_particles_pack load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Particles Pack",require:"Gamemode 4"}
execute unless score gm4_better_armour_stands load matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Particles Pack",require:"Better Armour Stands"}

execute if score gm4_particles_pack load matches 1 run function gm4_particles_pack:init
execute unless score gm4_particles_pack load matches 1 run schedule clear gm4_particles_pack:main
