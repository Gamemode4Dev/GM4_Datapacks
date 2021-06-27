execute if score gm4 load.status matches 1 run scoreboard players set gm4_xp_storage load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"XP Storage",require:"Gamemode 4"}

execute if score gm4_xp_storage load.status matches 1 run function gm4_xp_storage:init
execute unless score gm4_xp_storage load.status matches 1 run schedule clear gm4_xp_storage:main
execute unless score gm4_xp_storage load.status matches 1 run schedule clear gm4_xp_storage:tick
