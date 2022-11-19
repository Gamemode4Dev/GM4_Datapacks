execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 3 run scoreboard players set gm4_mountaineering load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Mountaineering",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 3 run data modify storage gm4:log queue append value {type:"missing",module:"Mountaineering",require:"Custom Crafters"}

execute if score gm4_mountaineering load.status matches 1 run function gm4_mountaineering:init
execute unless score gm4_mountaineering load.status matches 1 run schedule clear gm4_mountaineering:main
