execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 1 run scoreboard players set gm4_relocators load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Relocators",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Relocators",require:"Custom Crafters"}

execute if score gm4_relocators load.status matches 1 run function gm4_relocators:init
