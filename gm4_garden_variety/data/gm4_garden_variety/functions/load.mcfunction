execute if score gm4 load.status matches 1 run scoreboard players set gm4_garden_variety load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"garden_variety",require:"Gamemode 4"}
execute unless score gm4_lore load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Garden Variety",require:"Lib Lore"}
execute unless score gm4_fruiting_trees load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Garden Variety",require:"Fruiting Trees"}
execute unless score gm4_custom_crafters load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Garden Variety",require:"Custom Crafters"}


execute if score gm4_garden_variety load.status matches 1 run function gm4_garden_variety:init
execute unless score gm4_garden_variety load.status matches 1 run schedule clear gm4_garden_variety:clock/tick
execute unless score gm4_garden_variety load.status matches 1 run schedule clear gm4_garden_variety:clock/process_leaves
execute unless score gm4_garden_variety load.status matches 1 run schedule clear gm4_garden_variety:clock/process_analyzer
execute unless score gm4_garden_variety load.status matches 1 run schedule clear gm4_garden_variety:clock/process_arborist
