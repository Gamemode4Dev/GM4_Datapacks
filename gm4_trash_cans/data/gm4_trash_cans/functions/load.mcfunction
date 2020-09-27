execute if score gm4 load matches 1 run scoreboard players set gm4_trash_cans load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Trash Cans",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Trash Cans",require:"Custom Crafters"}

execute if score gm4_trash_cans load matches 1 run function gm4_trash_cans:init
execute unless score gm4_trash_cans load matches 1 run schedule clear gm4_trash_cans:main
