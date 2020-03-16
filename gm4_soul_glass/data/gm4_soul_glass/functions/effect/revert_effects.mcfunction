#@s = soul glass AEC
#run from effects/check

execute store result block ~ ~-1 ~ Primary int 1 run scoreboard players get @s gm4_sg_primary
execute store result block ~ ~-1 ~ Secondary int 1 run scoreboard players get @s gm4_sg_secondary

scoreboard players reset @s gm4_sg_primary
scoreboard players reset @s gm4_sg_secondary

playsound minecraft:block.beacon.power_select block @a[distance=..10]
particle minecraft:totem_of_undying ~ ~-1 ~ 0.5 0.5 0.5 .1 40 force
