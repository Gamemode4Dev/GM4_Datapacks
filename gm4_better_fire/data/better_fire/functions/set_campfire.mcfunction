#set campfire block
#@s - @e[nbt=!{Fire:-1s},type=arrow]
#called by better_fire:checks

execute if block ~ ~ ~ minecraft:campfire[signal_fire=false,facing=north] run setblock ~ ~ ~ minecraft:campfire[lit=true,signal_fire=false,facing=north]
execute if block ~ ~ ~ minecraft:campfire[signal_fire=false,facing=east] run setblock ~ ~ ~ minecraft:campfire[lit=true,signal_fire=false,facing=east]
execute if block ~ ~ ~ minecraft:campfire[signal_fire=false,facing=south] run setblock ~ ~ ~ minecraft:campfire[lit=true,signal_fire=false,facing=south]
execute if block ~ ~ ~ minecraft:campfire[signal_fire=false,facing=west] run setblock ~ ~ ~ minecraft:campfire[lit=true,signal_fire=false,facing=west]

execute if block ~ ~ ~ minecraft:campfire[signal_fire=true,facing=north] run setblock ~ ~ ~ minecraft:campfire[lit=true,signal_fire=true,facing=north]
execute if block ~ ~ ~ minecraft:campfire[signal_fire=true,facing=east] run setblock ~ ~ ~ minecraft:campfire[lit=true,signal_fire=true,facing=east]
execute if block ~ ~ ~ minecraft:campfire[signal_fire=true,facing=south] run setblock ~ ~ ~ minecraft:campfire[lit=true,signal_fire=true,facing=south]
execute if block ~ ~ ~ minecraft:campfire[signal_fire=true,facing=west] run setblock ~ ~ ~ minecraft:campfire[lit=true,signal_fire=true,facing=west]
