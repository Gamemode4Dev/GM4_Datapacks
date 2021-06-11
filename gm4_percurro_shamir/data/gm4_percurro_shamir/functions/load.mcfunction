execute if score gm4 load.status matches 1 run scoreboard players set gm4_percurro_shamir load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Percurro Shamir",require:"Gamemode 4"}

execute if score gm4_percurro_shamir load.status matches 1 run function gm4_percurro_shamir:init
