execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 2 run scoreboard players set gm4_forming_press load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Forming Press",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Forming Press",require:"Custom Crafters"}

execute if score gm4_forming_press load.status matches 1 run function gm4_forming_press:init
execute unless score gm4_forming_press load.status matches 1 run schedule clear gm4_forming_press:main
