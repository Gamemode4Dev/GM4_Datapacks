execute if score gm4 load.status matches 1 run scoreboard players set gm4_dripleaf_filters load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Dripleaf Filters",require:"Gamemode 4"}

execute if score gm4_dripleaf_filters load.status matches 1 run function gm4_dripleaf_filters:init
execute unless score gm4_dripleaf_filters load.status matches 1 run schedule clear gm4_dripleaf_filters:main
