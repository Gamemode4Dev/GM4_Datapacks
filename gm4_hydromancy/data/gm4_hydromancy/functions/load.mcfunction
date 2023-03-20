execute if score gm4 load.status matches 1 run scoreboard players set gm4_hydromancy load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Hydromancy",require:"Gamemode 4"}

execute if score gm4_hydromancy load.status matches 1 run function gm4_hydromancy:init
execute unless score gm4_hydromancy load.status matches 1 run schedule clear gm4_hydromancy:tick
execute unless score gm4_hydromancy load.status matches 1 run schedule clear gm4_hydromancy:main
execute unless score gm4_hydromancy load.status matches 1 run schedule clear gm4_hydromancy:clock_coral_core
execute unless score gm4_hydromancy load.status matches 1 run schedule clear gm4_hydromancy:clock_coral_vine
execute unless score gm4_hydromancy load.status matches 1 run schedule clear gm4_hydromancy:clock_tracked_fish
